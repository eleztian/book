# MySQL UDF 开发环境搭建

## 安装MySQL开发包

```bash
sudo apt-get install libmysqld-dev
```

## 安装c/c++环境

```bash
sudo apt-get install build-essential
```

## 例子

my_udf.c

```c
#if defined(_WIN32)
#define DLLEXP __declspec(dllexport)
#else
#define DLLEXP
#endif

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <mysql.h>

#ifndef  __mysqludf
#define  __mysqludf
extern "C"{
#endif

    /**
    * my_name
    */
    DLLEXP
        my_bool my_name_init(UDF_INIT *initid, UDF_ARGS *args, char *message){
            return 0;
        }

    DLLEXP
        void my_name_deinit(UDF_INIT *initid){}

    DLLEXP
        char* my_name(UDF_INIT *initid, UDF_ARGS *args, char *is_null, char *error){
            return "mysql_udf";
        }

    

#ifdef  __mysqludf
}
#endif
```
## 编译

```bash
gcc my_udf.c -I /usr/include/mysql/ -shared -o my_udf.so

```

## 使用

将编译生产的my_udf.so 移动到 /usr/lib/mysql/plugin目录下


```sql
CREATE FUNCTION my_name RETURNS STRING SONAME 'my_udf.so';
select my_name();

```

得到如下结果：
{{:databases:mysql:udf:深度截图_选择区域_20181016160144.png?400|}}
