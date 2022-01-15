#!/bin/sh
#
#Date:2021.12.19
#Author:GZ
#Mail:V2board@qq.com

process()
{
install_date="soga_LuFly_$(date +%Y-%m-%d_%H:%M:%S).log"
printf "
\033[36m#######################################################################
#                     欢迎使用soga一键部署脚本                        #
#                脚本适配环境CentOS7+/RetHot7+、内存1G+               #
#                更多信息请访问 https://gz1903.github.io              #
#######################################################################\033[0m
"

echo -e "\033[36m#######################################################################\033[0m"
echo -e "\033[36m#                                                                     #\033[0m"
echo -e "\033[36m#                  正在部署docker  时间较长请稍等~                    #\033[0m"
echo -e "\033[36m#                                                                     #\033[0m"
echo -e "\033[36m#######################################################################\033[0m"
yum -y install wget
yum -y install ca-certificates
wget --no-check-certificate https://raw.githubusercontent.com/supermalio/docker/main/rico-docker.sh && chmod +x  rico-docker.sh && bash rico-docker.sh

while :; do echo
    read -p "请输入V2board的IP或者域名（格式：http://x.x.x.x或者https://x.x.x.x）: " appip 
    [ -n "$appip" ] && break
done

while :; do echo
read -p "请输入需要对接的后端，输入1或2（1.v2board 2.sspanel）: " version 
if [ "$version" = "1" ]; then
	vs=v2board
    echo 正在对接$vs，请稍等~
	break
elif [ "$version" = "2" ]; then
	vs=sspanel-uim
    echo 正在对接$vs，请稍等~
	break
fi
done

while :; do echo
read -p "请输入需要后端对接类型，输入1或2（1.v2ray 2.trojan）: " types
if [ "$types" = "1" ]; then
	ts=v2ray
    echo 正在对接$ts，请稍等~
	break
elif [ "$types" = "2" ]; then
	ts=trojan
    echo 正在对接$ts，请稍等~
	break
fi
done

while :; do echo
    read -p "请输入对接节点ID，Node_ID：" id
    [ -n "$id" ] && break
done

while :; do echo
    read -p "请输入V2board与服务端通讯的密钥（或sspanel-Mukey）：" mk
    [ -n "$mk" ] && break
done

echo -e "\033[36m#######################################################################\033[0m"
echo -e "\033[36m#                                                                     #\033[0m"
echo -e "\033[36m#                  正在部署soga  时间较长请稍等~                      #\033[0m"
echo -e "\033[36m#                                                                     #\033[0m"
echo -e "\033[36m#######################################################################\033[0m"

docker run --restart=always --name sipermalio -d -v /etc/soga/:/etc/soga/ --network host cmdhim/crack-soga --type=$vs --server_type=$ts --api=webapi --webapi_url=$appip --webapi_mukey=$mk --soga_key=mgwx --node_id=$id

echo $?="部署完成，已授权无限制"

# 清除缓存垃圾
rm -rf /usr/local/src/docker_soga

echo -e "\033[32m--------------------------- 已完成 ---------------------------\033[0m"
echo -e "\033[32m 文件目录     :/etc/soga\033[0m"
echo -e "\033[32m 安装日志文件 :/var/log/"$install_date
echo -e "\033[32m------------------------------------------------------------------\033[0m"
echo -e "\033[32m 如果安装有问题请反馈安装日志文件。\033[0m"
echo -e "\033[32m 使用有问题请在这里寻求帮助:https://gz1903.github.io\033[0m"
echo -e "\033[32m 电子邮箱:v2board@qq.com\033[0m"
echo -e "\033[32m------------------------------------------------------------------\033[0m"
}
LOGFILE=/var/log/"soga_LuFly_$(date +%Y-%m-%d_%H:%M:%S).log"
touch $LOGFILE
tail -f $LOGFILE &
pid=$!
exec 3>&1
exec 4>&2
exec &>$LOGFILE
process
ret=$?
exec 1>&3 3>&-
exec 2>&4 4>&-\

