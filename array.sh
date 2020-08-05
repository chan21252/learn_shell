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