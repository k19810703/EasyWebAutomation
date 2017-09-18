# EasyWebAutomation 内测版
Web自动化测试平台，用户可以用过web的ui来编辑测试用例进行自动化测试
<br>*本guide目前仅有MAC版

## 部署

### 0.  说明&前提
本guide基于MAC和Linux的操作来编写的

前提
1.  安装有docker
如果没有安装，请自行去 https://www.docker.com/ 取得最新版


### 配置
在docker配置文件里添加
<pre><code>"insecure-registries" : ["blockchain-03.cn.ibm.com:83"]
</code></pre>

####    MAC
如下图配置后重启docker
![Image text](https://raw.githubusercontent.com/k19810703/myimages/master/dockerregistry1.png)

####    ubuntu
按下图添加编辑/etc/docker/daemon.json文件
![Image text](https://raw.githubusercontent.com/k19810703/myimages/master/dockerregistry2.png)


2.  6001端口和3307端口未被占用

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

### 3. 部署
<pre><code>cd compose
docker-compose pull
docker-compose up -d
</code></pre>

查看启动完的容器
<pre><code>docker ps
</code></pre>

找到db的容器名，执行初始化
<pre><code>docker exec -it {db镜像名} bash /init.sh
docker network connect bridge {db镜像名}
</code></pre>

### 4. 测试执行
docker执行
<pre><code>docker exec -it {agent镜像名} bash /usr/src/executetest.sh
</code></pre>


<br><br><br>任何问题，改进建议等请联系wuhd@cn.ibm.com
