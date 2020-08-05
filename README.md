# Shell

## 定义

shell是一个用C语言编写的程序，用户通过shell可以访问操作系统内核服务。

用户==>shell==>操作系统

shell脚本：为shell编写的脚本程序。

shell环境：

1. bourne shell（sh）
2. bourne again shell （bash）：大多数Linux系统的默认shell
3. C shell（csh）



## HelloWorld

``` bash
#!/bin/bash
echo "Hello World !"
```

1. #!是约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种 Shell。
2. echo命令用于向窗口输出文本。
3. 运行shell脚本的方法
    1. ./helloworld.sh：**./**表示在当前目录里找
    2. /bin/sh helloworld.sh

## 注释

单行注释

```bash
#--------------------------------------------
# 这是一个注释
# author：chan
# site：chan21252.github.io
# slogan：学的不仅是技术，更是梦想！
#--------------------------------------------
```



多行注释

```bash
:<<EOF
注释内容...
注释内容...
注释内容...
EOF
```



## 变量

定义

1. 变量名=值
2. **变量名和等号之间不能有空格**
3. 变量名
    1. 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头
    2. 中间不能有空格，可以使用下划线（_）
    3. 不能使用标点符号
    4. 不能使用bash里的关键字（可用help命令查看保留关键字）



使用变量

1. $变量名
2. ${变量名}：花括号帮助解释器识别变量边界，比如"My name is ${my_name}"



变量操作

1. 使变量只读：readonly
2. 删除变量：unset

```bash
#!/bin/bash

# 定义变量
my_name="chan"

# 使用变量
echo $my_name

# 只读变量
readonly my_name
my_name="chan21252"     #./variable.sh: my_name: readonly variable
echo "My name is ${my_name}"

# 删除变量
my_url='chan21252.github.io'
unset my_url
echo $my_url    #无输出
```





作用域

1. 局部变量：局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell不能访问。
2. 环境变量：所有的程序，包括shell启动的程序，都能访问环境变量。必要的时候shell脚本也可以定义环境变量。
3. shell变量：由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行。



## 数据类型

###  字符串

单引号：

1. 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
2. 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。



双引号：

1. 支持变量名占位
2. 支持转义字符



字符串操作

1. 拼接
    1. 双引号：
        1. "字符串1"${变量名}'"字符串2"
        2. "字符串1${变量名}字符串2"
    2. 单引号：
        1. '字符串1'${变量名}'字符串2'
2. 获取字符串长度
    1. ${#字符串变量名}
3. 提取子串
    1. ${字符串变量名:index:num}
4. 查找子串
    	1. \`expr index  "$字符串变量名" 子串\`

``` bash
#!/bin/bash

# author:chan
# description:字符串的用法

# 单引号
my_name='chan'
str1='My name is ${my_name}'    # My name is ${my_name}
str2='My name is '${my_name}'?' # My name is chan?
str3='My name is \'\''chan'     # My name is \'chan

echo $str1
echo $str2
echo $str3

# 双引号
str4="My name is ${my_name}"      # My name is chan
str5="My name is ""${my_name}""?" # My name is chan?
str6="My name is \"chan\""        # My name is "chan"

echo $str4
echo $str5
echo $str6

# 字符串拼接
echo "abc""de"
echo 'abc''de'

# 字符串长度
v1="abcdefg"
echo ${#v1} # 4

# 提取子串
echo ${v1:1:3}  # bcd

# 查找子串
echo `expr index $v1 fg` # 6
```



### 数组

定义

1. 数组名=(v1 v2 v3 ... vn)
2. 数组名[0]=v1

数组操作

1. 读取数组元素：${数组名[下标]}
2. 读取所有元素：${数组名[@]}
3. 获取数组长度：${#数组名[@]}或者${#数组名[*]}
4. 获取数组某个元素长度：${#数组名[n]}

```bash
#!/bin/bash

# author:chan
# description:数组的用法

# 定义数组
arr1=(1 3 5 7 9)

arr2[0]=2
arr2[1]=4
arr2[2]=6

# 访问数组元素
echo ${arr1[2]} # 5
echo ${arr1[@]} # 1 3 5 7 9

# 获取数组长度
len1=${#arr1[@]} # 5
len2=${#arr2[*]} # 3
len_element=${#arr1[0]} # 1

echo $len1
echo $len2
echo $len_element
```



