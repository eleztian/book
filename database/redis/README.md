# Redis


## Redis 安装

  * 安装：sudo apt-get install redis-server
  * 状态：sudo /etc/init.d/redis-server status

## 配置远程访问

  * sudo vi /etc/redis/redis.conf 注释bind
  * 给 redis设置密码 
    
    * redis-cli
    * config set requirepass 123456