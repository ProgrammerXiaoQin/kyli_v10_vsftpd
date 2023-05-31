#kyli_v10_vsftpd 银河麒麟局域网ftp服务器部署
### 1. 系统设置
1. 打开设置 -> 安全 -> 账户保护 -> 自定义密码强度 , 密码最小长度选择为1 , 密码至少包含字符种类选择为1种

2. 打开设置 - > 系统 ->电源 , 此段时间后系统进入休眠选择为从不

### 2. 添加账户
1. 打开终端 , 输入`sudo useradd admin` 这里的admin可以改为自定义账户名
	- 自定义账户名不可以使用`root , daemon , bin , sys , sync , games , man , lp , mail , news , uucp , nobody`等系统内置账户
2. 在终端中输入`sudo passwd admin` 修改账户密码 这里的admin可以改为刚刚自定义账户名
	- 按照提示连续输入两次密码 , 为了方便密码我一般用123

### 3. 部署vsftpd
1. 解压`vsftpd服务配置文件` 

2. 编辑vsftpd.sh文件
	- `#用户名` username=admin 中的admin换成刚刚自定义的用户名
	- `#存放文件目录` userftp=/data/ftp中的/data/ftp换成自己想存放ftp服务文件的目录 , /data目录为麒麟系统的数据盘
	- `#本机ip`  ip_local=10.154.88.12中的ip地址换成当前电脑的ip
	- 保存退出
	- 切记 , username=admin , userftp=/data/ftp , ip_local=10.154.88.12等等=两边不能有空格 , 切记切记切记

3. 部署vsftpd
	-  进入vsftpd服务配置文件目录 , 右键打开终端
	-  在终端中输入`sudo -s` , 按照提示输入密码 , 切换成管理员账户
	-  在终端中输入`bash vsftpd.sh` 命令开始部署 , 命令行滚动结束后部署成功
	- 打开本机文件管理或者其他电脑的文件管理 , 在地址栏输入`ftp://服务器ip` 即可访问ftp服务
