# mysql


## MySQL 安装

  * sudo apt-get install mysql-server
  * sudo apt install mysql-client
  * sudo apt install libmysqlclient-dev

##  配置远程访问

  * sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf。注释掉bind-address = 127.0.0.1
  * mysql -u root -p


      * grant all on *.* to root@'%' identified by '你的密码' with grant option;
      * flush privileges;

  * service mysql restart

## 修改root初始密码(5.7.21)

* 切换到root用户
* mysql -u root
* 修改密码

```sql
update user set authentication_string=PASSWORD("123456"), plugin='mysql_native_password' WHERE User="root";
flush privileges;
exit;
```

* 重启mysql

==== mysql tools ====
[[databases:mysql:tools#compare|数据库比较]]

