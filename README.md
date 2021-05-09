# start.sh
Скрипт позволяет запускать сервера Minecraft (как и другие Java приложения) с возможностью перезапуска процесса в случае его отключения, а также с записью логов подобных перезапусков. 

Добавлены флаги от **Aikar** выбираемые в зависимости от кол-ва выделенной памяти. 

Рекомендуемый способ запуска: **screen -dmS server ./start.sh**

```bash
#!/bin/bash

JAR=ядро.jar
MAXRAM=кол-во выделяемой памяти
RAMTYPE="G"
CLASSPATH=/data/servers/shared/libs/*
FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX>

if (( $MAXRAM >= 12 )); then
    FLAGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50>
fi

TIME=20

while [ true ]; do
    java -Xms$MAXRAM$RAMTYPE -Xmx$MAXRAM$RAMTYPE $FLAGS -cp $CLASSPATH -jar $JAR nogui
    if [[ ! -d "logs" ]]; then
        mkdir "logs";
    fi
    if [[ ! -f "logs/restart.log" ]]; then
        touch "logs/restart.log";
    fi
    echo "[$(date +"%d.%m.%Y %T")]: $?" >> logs/restart.log
    echo "----- Press enter to prevent the server from restarting in $TIME seconds -----";
    read -t $TIME input;
    if [ $? == 0 ]; then
        break;
    else
        echo "------------------- SERVER RESTART -------------------";
    fi
done
```
