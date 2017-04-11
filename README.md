# EasyWebAutomation 内测版
Web自动化测试平台，用户可以用过web的ui来编辑测试用例进行自动化测试
<br>*本guide目前仅有MAC版

## 概要
按照本说明可以在有docker的环境下启动3个docker，一个自动化测试管理的webui服务，一个数据库（包含需要的table，和2个demo测试用例），二个测试机（ubuntu+firefox，ubuntu+chrome）


## 部署(本地)

### 0.  说明&前提
本guide基于MAC和Linux的操作来编写的

前提
1.  安装有docker
如果没有安装，请自行去 https://www.docker.com/ 取得最新版
2.  有w3id，并注册过bluemix
3.  联系 wuhd@cn.ibm.com 添加git权限
4.  80端口和3307端口未被占用

### 1.  下载至本地
有git的情况下
1.  在本地环境创建工作目录workfolder（名字任意）
2.  在terminal窗口中
<pre><code>cd workfolder
git clone https://github.com/k19810703/EasyWebAutomation.git
</code></pre>

无git的情况下
1.  下载zip到本地
2.  解压

### 2.  打开terminal，并切换到EasyWebAutomation目录

### 3. 添加bluemix登录账号和密码
<pre><code>echo "https://{youid}%40cn.ibm.com:{yourpassword}@hub.jazz.net" > ./ui/.git-credentials
</code></pre>

### 4.  部署数据库

数据库用户名root,密码123456，端口3307
如果想使用自定义密码端口或3307端口被占用，请打开db_init.sh自行修改
<pre><code>bash db_init.sh
</code></pre>
注：使用前请先备份所需的数据

### 5.  部署WebUI
如果80端口被占用，请打开ui_init.sh根据注释适当修改
<pre><code>bash ui_init.sh
</code></pre>
由于网络问题，git clone和npm install可能会失败，多试几次即可
<Br>注：成功后，请使用浏览器连接 http://localhost 验证部署成功<br>
通过UI可以看到已经做了一个当当网的demo测试用例<br>
如果使用自定义端口 http://localhost:yourport

### 6.  部署测试机

第一次使用时：

自动执行（会响应web ui上的Execute test按钮）
<pre><code>bash autoagent_init.sh Firefox cloud_agent1
bash testagent_init.sh Chrome cloud_agent2
</code></pre>
自动测试机的时候的话请使用以上2个命令，参数不要改

如果测试机image已经存在，即使用以下命令
<pre><code>docker images
</code></pre>
时，<br>
webautota_firefox_image<br>
webautota_chrome_image<br>
存在的情况下无需重新build镜像，最后加上NoBuild参数<br>
<pre><code>bash autoagent_init.sh Firefox/Chrome agentname NoBuild
</code></pre>


### 7.  执行测试
通过web ui的plan界面的execute test按钮来执行测试,测试会被在自动执行测试机上运行
或者通过以下命令在指定手动执行机上运行
<pre><code>bash execute.sh firefox/chrome {agentname}
</code></pre>
agentname 可以通过docker ps来查找

### 8.  清理环境
<pre><code>bash cleanall.sh
</code></pre>
注：如果有数据请先备份，该步处理会清理掉3个容器和镜像，未备份的数据将丢失

## 部署(Bluemix)

### 0.  前提
1.  请在本地部署成功的前提下做以下部署
2.  <a href="http://clis.ng.bluemix.net/ui/home.html">bluemix CLI</a> 和 Bluemix Containers Plugin已经安装
Bluemix Containers Plugin安装命令
<pre><code>bluemix plugin install IBM-Containers -r Bluemix</code></pre>
3.  bluemix container相关初始化已完成

### 1.  部署数据库
1.  tag本地镜像
<pre><code>docker tag webautodbimage registry.ng.bluemix.net/{your_name_space}/webautodbimage
</code></pre>

2.  push镜像到bluemix
<pre><code>docker push registry.ng.bluemix.net/{your_name_space}/webautodbimage
</code></pre>

3. 创建数据库容器
<pre><code>bx ic run --name webautoudb -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -d registry.ng.bluemix.net/{your_name_space}/webautodbimage
</code></pre>

4.  绑定ip

如果已经有ip
<pre><code>bx ic ips
</code></pre>

如果没有，request一个
<pre><code>bx ic ip-request
</code></pre>

绑定ip
<pre><code>bx ic ip-bind {ipaddress} {containerid}
</code></pre>

5.  初始化数据库
请等待数据库服务完全启动完毕后执行初始化，可以使用mysql客户端连接数据库以确认完全启动完毕
<pre><code>bx ic exec -it webautodb bash init.sh
</code></pre>


### 2.  部署UI
1.  tag本地镜像
<pre><code>docker tag webautouiimage registry.ng.bluemix.net/{your_name_space}/webautouiimage
</code></pre>

2.  push镜像到bluemix
<pre><code>docker push registry.ng.bluemix.net/{your_name_space}/webautouiimage
</code></pre>

3.  请求volume
<pre><code>bx ic volume-create webautooutput
bx ic volume-create webautoinput
</code></pre>

4. 创建UI容器
<pre><code>bx ic run -it --name webautoui -v webautooutput:/usr/src/chanceauto/public/output -v webautoinput:/usr/src/chanceauto/public/input --link webautodb:mysqldocker -p 6001:6001 -d registry.ng.bluemix.net/{your_name_space}/webautouiimage
</code></pre>

5.  绑定ip
参考数据库部分
注：成功后，请使用浏览器连接 http://ipaddress:6001 验证部署成功<br>

### 3.  部署测试机
1.  tag本地镜像
<pre><code>docker tag webautota_firefox_image registry.ng.bluemix.net/{your_name_space}/webautota_firefox_image
docker tag webautota_chrome_image registry.ng.bluemix.net/{your_name_space}/webautota_chrome_image
</code></pre>

2.  push镜像到bluemix
<pre><code>docker push registry.ng.bluemix.net/{your_name_space}/webautota_firefox_image
docker push registry.ng.bluemix.net/{your_name_space}/webautota_chrome_image
</code></pre>

3. 创建测试机容器
<pre><code>bx ic run --name firefox_cloud_agent1 -d -e "agentname=cloud_agent1" -e "testbrowser=Firefox" -v webautooutput:/usr/src/output -v webautoinput:/usr/src/input --link webautodb:mysqldocker registry.ng.bluemix.net/{your_name_space}/webautota_firefox_image
bx ic run --name chrome_cloud_agent2 -d -e "agentname=cloud_agent2" -e "testbrowser=Chrome" -v webautooutput:/usr/src/output -v webautoinput:/usr/src/input --link webautodb:mysqldocker registry.ng.bluemix.net/{your_name_space}/webautota_chrome_image
</code></pre>

4. 启动监听job
<pre><code>bx ic exec -d firefox_cloud_agent1 bash /usr/src/selfexecute.sh
bx ic exec -d chrome_cloud_agent2 bash /usr/src/selfexecute.sh
</code></pre>

<br><br><br>任何问题，改进建议等请联系wuhd@cn.ibm.com
