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
