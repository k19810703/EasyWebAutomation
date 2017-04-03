# EasyWebAutomation 内测版
Web自动化测试平台，用户可以用过web的ui来编辑测试用例进行自动化测试
<br>*本guide目前仅有MAC版

## 前提
1.  安装有docker
如果没有安装，请自行去https://www.docker.com/取得最新版
2.  有w3id，并注册过bluemix
3.  联系 wuhd@cn.ibm.com 添加git权限

## 概要
按照本说明可以在有docker的环境下启动3个docker，一个自动化测试管理的webui服务，一个数据库（包含需要的table，和2个demo测试用例），一个测试机（ubuntu+firefox）


## 部署

### 0.  说明
本guide基于MAC和Linux的操作来编写的，如果是Windows，请自行替换bash abc.sh为abc.bat
<br>windows用的batch尚未提供

### 1.  下载至本地
有git的情况下
1.  在本地环境创建工作目录workfolder（名字任意）
2.  在terminal/cmd窗口中
<pre><code>
cd workfolder
git clone https://github.com/k19810703/EasyWebAutomation.git
</code></pre>

无git的情况下
1.  下载zip到本地
2.  解压

### 2.  打开terminal/cmd，并切换到EasyWebAutomation目录

### 3. 添加bluemix登录账号和密码
<code>
echo "https://{youid}%40cn.ibm.com:{yourpassword}@hub.jazz.net" > ./ui/.git-credentials
</code>

### 4.  部署数据库

数据库用户名root,密码123456，端口3307
如果想使用自定义密码端口或3307端口被占用，请打开db_init.sh自行修改<br>
<code>
docker run --name webautodb -e MYSQL_ROOT_PASSWORD=123456 -p 3307:3306 -d webautodbimage
</code>

<code>
bash db_init.sh
</code>
<Br>注：使用前请先备份所需的数据

### 5.  部署WebUI
<code>
bash ui_init.sh
</code>
<Br>注：成功后，请使用浏览器连接 http://localhost 验证部署成功

### 6.  部署测试机
为了方便表示，请打开./testagent/webautotest/config/automation.ini文件修改youname为你想要的名字<br>
<code>
bash testagent_init.sh
</code>
<Br>注：如需debug，使用vnc客户端连接vnc://localhost:5901,MAC下直接使用safari连接即可,密码secret

### 7.  执行测试
<code>
bash execute.sh
</code>

### 8.  清理环境
<code>
bash cleanall.sh
</code>
注：如果有数据请先备份，该步处理会清理掉3个容器和镜像，未备份的数据将丢失

<br><br><br>任何问题，改进建议等请联系wuhd@cn.ibm.com
