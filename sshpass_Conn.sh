#!/bin/bash

#Shell Script Name
sh_name=test.sh

#Date
date=$(date +"%Y%m%d%H%M%S")

#Directory 위치
tool_dir=$HOME/tool
temp_dir=$tool_dir/temp
work_dir=$temp_dir/test

#mkdir -p 옵션으로 없으면 생성
mkdir -p $work_dir

#Login 정보
###############################
login_id="root"
login_pw="password"
###############################

echo "########################################"
echo "        SSH Connect Shell Script        "
echo "########################################"

#ip 입력 받기
echo "Enter the IP"
read ip_addr
echo "Input IP : $ip_addr"

Check=`cat $HOME/list.txt | grep $ip_addr | wc -l`
echo "[$date] $sh_name started"

#if 문으로 Check 가 1이면 접속
if [ $Check == 1 ]
    then
    echo "Reading File in list.txt"  
    echo "Correct! -> Wait for Connect" 
    sshpass -p ${login_pw} ssh -o LogLevel=quiet -o StrictHostKeyChecking=no ${login_id}@${ip_addr} -p22  

#elif 로 Check 가 0이면 접속안하고 종료
    elif [ $Check == 0 ]
    then
    echo "****Do not exist IP on list****" 
    echo "****Please Check IP Address****" 
    exit

#그것도 아니라면 제대로 된 ip 주소를 입력하라고 메시지"
    else
    echo "Please typed ip addr" 
fi
# 출처: https://infraryu.tistory.com/64 [Infra:티스토리]