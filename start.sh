#! /bin/bash
application='/root/web/vue/VUE/'
a='hello'
b=`ps -aux| grep 'npm run dev' | grep -v 'grep'| wc -l`
if [ ! $1 ];then
 echo "请传参数 start|stop|restart"  
else
 if [ $1 == "start" ];then
    if [ "$b" -gt "0" ];then
        echo "<---------------------程序总是运行--------------------->"
    else
        nohup npm run dev >${application}info.log 2>log &
        echo "<---------------------程序运行成功--------------------->" 
   fi
 fi

 if [ $1 == 'stop' ];then
    pid=`ps -aux | grep 'node /root/web/vue/VUE' | grep -v 'grep' | awk '{print $2}'`
    if [ ! $pid ];then
      echo "<--------程序不在运行------->"
    else
      kill -s 9 $pid
      echo "<--------程序已停止------->"
    fi
 fi

 if [ $1 == 'restart' ];then
    pid=`ps -aux | grep 'node /root/web/vue/VUE' | grep -v 'grep' | awk '{print $2}'`
    if [ ! $pid ];then
      nohup npm run dev >${application}info.log 2>log &
      echo "<---------------------程序未在运行，程序已启动--------------------->"
    else
      kill -s 9 $pid
      nohup npm run dev >${application}info.log 2>log &
      echo "<---------------------程序已重启--------------------->"
    fi
 fi
fi