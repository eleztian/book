# MYSQL 工具 - Compare

## Compare

### 安装

mysqldiff是MySQL Utilities中的一个脚本，默认的MySQL不包含这个工具集，所以需要独立安装。

* MySQL Utilities下载地址：http://downloads.mysql.com/archives/utilities/
* Windows系统中需提前安装“Visual C++ Redistributable Packages for Visual Studio 2013”，下载地址：https://www.microsoft.com/en-gb/download/details.aspx?id=40784。

### 参数

* --server1：MySQL服务器1配置。
* --server2：MySQL服务器2配置。如果是同一服务器，--server2可以省略。
* db1:db2：要比较的两个数据库。如果比较不同服务器上的同名数据库，可以省略:db2。
* --all：比较所有两服务器上所有的同名数据库。--exclude排除无需比较的数据库。
* --run-all-tests：运行完整比较，遇到第一次差异时不停止。
* --changes-for=：修改对象。例如--changes-for=server2，那么对比以sever1为主，生成的差异的修改也是针对server2的对象的修改。
* -d DIFFTYPE,--difftype=DIFFTYPE：差异的信息显示的方式，有[unified|context|differ|sql]，默认是unified。如果使用sql，那么就直接生成差异的SQL，这样非常方便。
* --show-reverse：在生成的差异修改里面，同时会包含server2和server1的修改。
* --skip-table-options：保持表的选项不变，即对比的差异里面不包括表名、AUTO_INCREMENT、ENGINE、CHARSET等差异。
* --skip-diff：跳过对象定义比较检查。所谓对象定义，就是CREATE语句()里面的部分，--skip-table-options是()外面的部分。
* --skip-object-compare：默认情况下，先检查两个数据库中相互缺失的对象，再对都存在对象间的差异。这个参数的作用就是，跳过第一步，不检查相互缺失的对象。
* --skip-checksum-table：数据一致性验证时跳过CHECKSUM TABLE。
* --skip-data-check：跳过数据一致性验证。
* --skip-row-count：跳过字段数量检查。

### 示例

```bash
mysqldbcompare --server1=debian-sys-maint:8bPQvi2GUFU6tHlK@127.0.0.1:3306 --server2=debian-sys-maint:8bPQvi2GUFU6tHlK@127.0.0.1:3306 online_online:online_test --skip-checksum-table --skip-row-count --run-all-tests --difftype=sql > diff.sql
```