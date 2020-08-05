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