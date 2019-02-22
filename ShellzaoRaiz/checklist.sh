#!/bin/bash
#############################################
## funcao que lista as opcoes ###
lista(){
echo -e "Opcoes possiveis:"
echo ""
#### Adicionar aqui novas opcoes ###
echo -e "a) - checagem e instalacao de servicos"
echo -e "b) - checagem e instalacao de pacotes "
echo -e "c) - checagem e alteracao do sysctl"
echo -e "d) - checagem e adicao de usuarios e grupos"
echo -e "e) - checagem e alteracao do limits"
echo -e "f) - checagem e alteracao do resolv.conf"


echo ""
echo "Selecione uma das opcoes acima"
read paraocase
}
#############################################
lista
########### Funcoes ###################


apli-exemplo(){
clear
echo "aplicacao de exemplo"
}


###------------------------------------###


check-services() {
clear
## ntp
echo "procurando o pacote do ntpd"
sleep 1.5
ntp=$(rpm -q ntp) 
rpm -q ntp &> /dev/null
if test $? -eq 0
then 
echo "pacote encontrado \"$ntp\""
else
echo "pacote nao encontrado, instalando:"
yum install ntp -y
rpm -q ntp
fi


sleep 1
echo "checagem da inicializacao"
chkconfig ntpd on
chkconfig --list ntpd


sleep 1
echo "Alteracao no arquivo de configuracao"
sed -i 20,24s/^server\ /#server\ / /etc/ntp.conf


nserver=$(sed -n 25p /etc/ntp.conf | grep -o server)
if test $nserver = server
then
echo
else
sed -i 25i'server ntp.server' /etc/ntp.conf
fi


echo "<<<<<<<<<<<<<<<<< trecho do arquivo alterado >>>>>>>>>>>>>>>>>"
sed -n 19,26p /etc/ntp.conf


sleep 1.5




## ssh
clear
echo "procurando o pacote do ssh"
sleep 1.5
ssh=$(rpm -q openssh)
rpm -q openssh &> /dev/null
if test $? -eq 0
then
echo "pacote encontrado \"$ssh\""
else
echo "pacote nao encontrado, instalando:"
yum install openssh -y
rpm -q openssh
fi
sleep 1
echo "checagem da inicializacao"
chkconfig sshd on
chkconfig --list sshd


### rsh-server
clear
echo "procurando o rsh-server"
sleep 1.5
echo "procurando o pacote do ssh"
rsh=$(rpm -q rsh-server)
rpm -q rsh-server &> /dev/null
if test $? -eq 0
then
echo "pacote encontrado \"$rsh\""
else
echo "pacote nao encontrado, instalando:"
yum install rsh-server -y
rpm -q rsh-server
fi


### nfs-utils
clear
echo "procurando o cliente do nfs"
sleep 1.5
echo "procurando o pacote do nfs"
nfs=$(rpm -q nfs-utils)
rpm -q nfs-utils &> /dev/null
if test $? -eq 0
then
echo "pacote encontrado \"$nfs\""
else
echo "pacote nao encontrado, instalando:"
yum install nfs-utils -y
rpm -q nfs-utils
fi


### syslog ou rsyslog
clear
echo "procurando o syslog ou rsyslog"
sleep 1.5
echo "procurando os pacotes rsyslog ou syslog"


if rpm -q sysklogd &> /dev/null
then
aa=sysklogd
elif rpm -q rsyslog &> /dev/null
then
aa=rsyslog
fi


case $aa in
sysklogd)


sysklogd=$(rpm -q sysklogd)


echo o pacote encontrado "$sysklogd"
;;


rsyslog)


rsyslog=$(rpm -q rsyslog)
echo o pacote encontrado "$rsyslog"
;;
esac


}


###------------------------------------###


pacotes(){
echo -e "escola uma das opcoes\n a) oracle\n b) S.O"
read paco


case $paco in


a)
clear
sleep 1.5
echo "Verificando o pacote binutils"
if rpm -q binutils &> /dev/null
then
sleep 1
echo pacote binutils instalado
else
yum install binutils -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-libstdc++-33"
if rpm -q compat-libstdc++-33 &> /dev/null
then
sleep 1
echo pacote compat-libstdc++-33 instalado
else
yum install compat-libstdc++-33 -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-libstdc++-33"
if rpm -q compat-libstdc++-33 &> /dev/null
then
sleep 1
echo pacote compat-libstdc++-33 instalado
else
yum install compat-libstdc++-33 -y
fi


clear
sleep 1.5
echo "Verificando o pacote elfutils-libelf"
if rpm -q elfutils-libelf &> /dev/null
then
sleep 1
echo pacote elfutils-libelf instalado
else
yum install elfutils-libelf -y
fi


clear
sleep 1.5
echo "Verificando o pacote gcc"
if rpm -q gcc &> /dev/null
then
sleep 1
echo pacote gcc instalado
else
yum install gcc -y
fi


clear
sleep 1.5
echo "Verificando o pacote gcc-c++"
if rpm -q gcc-c++ &> /dev/null
then
sleep 1
echo pacote gcc-c++ instalado
else
yum install gcc-c++ -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc"
if rpm -q glibc &> /dev/null
then
sleep 1
echo pacote glibc instalado
else
yum install glibc -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-common"
if rpm -q glibc-common &> /dev/null
then
sleep 1
echo pacote glibc-common instalado
else
yum install glibc-common -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-devel"
if rpm -q glibc-devel &> /dev/null
then
sleep 1
echo pacote glibc-devel instalado
else
yum install glibc-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-headers"
if rpm -q glibc-headers &> /dev/null
then
sleep 1
echo pacote glibc-headers instalado
else
yum install glibc-headers -y
fi


clear
sleep 1.5
echo "Verificando o pacote ksh"
if rpm -q ksh &> /dev/null
then
sleep 1
echo pacote ksh instalado
else
yum install ksh -y
fi


clear
sleep 1.5
echo "Verificando o pacote libaio"
if rpm -q libaio &> /dev/null
then
sleep 1
echo pacote libaio instalado
else
yum install libaio -y
fi


clear
sleep 1.5
echo "Verificando o pacote libaio-devel"
if rpm -q libaio-devel &> /dev/null
then
sleep 1
echo pacote libaio-devel instalado
else
yum install libaio-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgomp"
if rpm -q libgomp &> /dev/null
then
sleep 1
echo pacote libgomp instalado
else
yum install libgomp -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgcc"
if rpm -q libgcc &> /dev/null
then
sleep 1
echo pacote libgcc instalado
else
yum install libgcc -y
fi


clear
sleep 1.5
echo "Verificando o pacote libstdc++"
if rpm -q libstdc++ &> /dev/null
then
sleep 1
echo pacote libstdc++ instalado
else
yum install libstdc++ -y
fi


clear
sleep 1.5
echo "Verificando o pacote libstdc++-devel"
if rpm -q libstdc++-devel &> /dev/null
then
sleep 1
echo pacote libstdc++-devel instalado
else
yum install libstdc++-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote make"
if rpm -q make &> /dev/null
then
sleep 1
echo pacote make instalado
else
yum install make -y
fi


clear
sleep 1.5
echo "Verificando o pacote sysstat"
if rpm -q sysstat &> /dev/null
then
sleep 1
echo pacote sysstat instalado
else
yum install sysstat -y
fi


clear
sleep 1.5
echo "Verificando o pacote unixODBC"
if rpm -q unixODBC &> /dev/null
then
sleep 1
echo pacote unixODBC instalado
else
yum install unixODBC -y
fi


clear
sleep 1.5
echo "Verificando o pacote unixODBC-devel"
if rpm -q unixODBC-devel &> /dev/null
then
sleep 1
echo pacote unixODBC-devel instalado
else
yum install unixODBC-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote numactl-devel"
if rpm -q numactl-devel &> /dev/null
then
sleep 1
echo pacote numactl-devel instalado
else
yum install numactl-devel -y
fi
;;


b)
clear
sleep 1.5
echo "Verificando o pacote binutils"
if rpm -q binutils &> /dev/null
then
sleep 1
echo pacote binutils instalado
else
yum install binutils -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-db"
if rpm -q compat-db &> /dev/null
then
sleep 1
echo pacote compat-db instalado
else
yum install compat-db -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-libstdc++-296"
if rpm -q compat-libstdc++-296 &> /dev/null
then
sleep 1
echo pacote compat-libstdc++-296 instalado
else
yum install compat-libstdc++-296 -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-libstdc++-33"
if rpm -q compat-libstdc++-33 &> /dev/null
then
sleep 1
echo pacote compat-libstdc++-33 instalado
else
yum install compat-libstdc++-33 -y
fi


clear
sleep 1.5
echo "Verificando o pacote control-center"
if rpm -q control-center &> /dev/null
then
sleep 1
echo pacote control-center instalado
else
yum install control-center -y
fi


clear
sleep 1.5
echo "Verificando o pacote gcc"
if rpm -q gcc &> /dev/null
then
sleep 1
echo pacote gcc instalado
else
yum install gcc -y
fi


clear
sleep 1.5
echo "Verificando o pacote gcc-c++"
if rpm -q gcc-c++ &> /dev/null
then
sleep 1
echo pacote gcc-c++ instalado
else
yum install gcc-c++ -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc"
if rpm -q glibc &> /dev/null
then
sleep 1
echo pacote glibc instalado
else
yum install glibc -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-common"
if rpm -q glibc-common &> /dev/null
then
sleep 1
echo pacote glibc-common instalado
else
yum install glibc-common -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-devel"
if rpm -q glibc-devel &> /dev/null
then
sleep 1
echo pacote glibc-devel instalado
else
yum install glibc-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote glibc-headers"
if rpm -q glibc-headers &> /dev/null
then
sleep 1
echo pacote glibc-headers instalado
else
yum install glibc-headers -y
fi


clear
sleep 1.5
echo "Verificando o pacote ksh-20060214-1.4"
if rpm -q ksh-20060214-1.4 &> /dev/null
then
sleep 1
echo pacote ksh-20060214-1.4 instalado
else
yum install ksh-20060214-1.4 -y
fi


clear
sleep 1.5
echo "Verificando o pacote libaio"
if rpm -q libaio &> /dev/null
then
sleep 1
echo pacote libaio instalado
else
yum install libaio -y
fi


clear
sleep 1.5
echo "Verificando o pacote libaio-devel"
if rpm -q libaio-devel &> /dev/null
then
sleep 1
echo pacote libaio-devel instalado
else
yum install libaio-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote elfutils-libelf-devel"
if rpm -q elfutils-libelf-devel &> /dev/null
then
sleep 1
echo pacote elfutils-libelf-devel instalado
else
yum install elfutils-libelf-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgcc"
if rpm -q libgcc &> /dev/null
then
sleep 1
echo pacote libgcc instalado
else
yum install libgcc -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgnome"
if rpm -q libgnome &> /dev/null
then
sleep 1
echo pacote libgnome instalado
else
yum install libgnome -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgnomeui"
if rpm -q libgnomeui &> /dev/null
then
sleep 1
echo pacote libgnomeui instalado
else
yum install libgnomeui -y
fi


clear
sleep 1.5
echo "Verificando o pacote libgomp"
if rpm -q libgomp &> /dev/null
then
sleep 1
echo pacote libgomp instalado
else
yum install libgomp -y
fi


clear
sleep 1.5
echo "Verificando o pacote libstdc++"
if rpm -q libstdc++ &> /dev/null
then
sleep 1
echo pacote libstdc++ instalado
else
yum install libstdc++ -y
fi


clear
sleep 1.5
echo "Verificando o pacote libstdc++-devel"
if rpm -q libstdc++-devel &> /dev/null
then
sleep 1
echo pacote libstdc++-devel instalado
else
yum install libstdc++-devel -y
fi


clear
sleep 1.5
echo "Verificando o pacote libXp"
if rpm -q libXp &> /dev/null
then
sleep 1
echo pacote libXp instalado
else
yum install libXp -y
fi


clear
sleep 1.5
echo "Verificando o pacote libXtst"
if rpm -q libXtst &> /dev/null
then
sleep 1
echo pacote libXtst instalado
else
yum install libXtst -y
fi


clear
sleep 1.5
echo "Verificando o pacote make"
if rpm -q make &> /dev/null
then
sleep 1
echo pacote make instalado
else
yum install make -y
fi


clear
sleep 1.5
echo "Verificando o pacote sysstat"
if rpm -q sysstat &> /dev/null
then
sleep 1
echo pacote sysstat instalado
else
yum install sysstat -y
fi


clear
sleep 1.5
echo "Verificando o pacote compat-libcap1"
if rpm -q compat-libcap1 &> /dev/null
then
sleep 1
echo pacote compat-libcap1 instalado
else
yum install compat-libcap1 -y
fi


clear
sleep 1.5
echo "Verificando o pacote ksh"
if rpm -q ksh &> /dev/null
then
sleep 1
echo pacote ksh instalado
else
yum install ksh -y
fi
;;


esac


}
###------------------------------------###


sysctl() {


if test -e /etc/sysctl.conf.bkp
then
echo "O arquivo /etc/sysctl.conf esta alterado conforme ultimo vez que o script rodou"
else


for i in net.ipv4.tcp_window_scaling net.ipv4.conf.default.rp_filter net.ipv4.conf.all.rp_filter net.ipv4.ip_forward net.core.netdev_max_backlog net.core.somaxconn net.ipv4.tcp_keepalive_intvl net.ipv4.tcp_keepalive_probes net.ipv4.tcp_fin_timeout net.ipv4.tcp_keepalive_time net.ipv4.tcp_sack net.ipv4.tcp_timestamps net.ipv4.ip_local_port_range net.core.rmem_max net.core.wmem_max net.core.rmem_default net.core.wmem_default net.core.optmem_max net.ipv4.ipfrag_high_thresh net.ipv4.ipfrag_low_thresh net.ipv4.tcp_mem net.ipv4.tcp_wmem net.ipv4.tcp_rmem net.ipv4.tcp_max_tw_buckets net.ipv4.tcp_max_syn_backlog net.ipv4.conf.all.accept_redirects net.ipv4.conf.all.log_martians net.ipv4.conf.all.forwarding
do 
prima=$(grep $i /etc/sysctl.conf)
sed -i /"$i"/d /etc/sysctl.conf
done


cat << EOF >> /etc/sysctl.conf
################################################################## Parametros Alterados de Rede #################################################################################
net.ipv4.tcp_window_scaling = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.rp_filter=1
net.ipv4.ip_forward = 1
net.core.netdev_max_backlog=3000
net.core.somaxconn = 3000
net.ipv4.tcp_keepalive_intvl=15
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_fin_timeout=7
net.ipv4.tcp_keepalive_time = 1800
net.ipv4.tcp_sack = 0
net.ipv4.tcp_timestamps = 0
net.ipv4.ip_local_port_range = 16384 65535
net.core.rmem_max = 25165824
net.core.wmem_max = 25165824
net.core.rmem_default = 25165824
net.core.wmem_default = 25165824
net.core.optmem_max = 25165824
net.ipv4.ipfrag_high_thresh = 512000
net.ipv4.ipfrag_low_thresh = 446464
net.ipv4.tcp_mem = 688128 737280 786432
net.ipv4.tcp_wmem = 4096 87380 4194304
net.ipv4.tcp_rmem = 4096 87380 4194304
net.ipv4.tcp_max_tw_buckets = 2000000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.all.forwarding = 0
EOF


echo conteudo adicionado no final do arquivo sysctl.conf


#cp /etc/sysctl.conf /etc/sysctl.conf.bkp 
fi
}



###------------------------------------###


users-groups() {
echo "estes sao os usuarios existentes no momento"


grep '/bin/bash' /etc/passwd | awk -F: '($3 >= 500 ) { print $1 }'


echo
echo


echo -e "Escolha uma das opcoes\n a) oracle\n b) weblogic\n c) tomcat\n d) digitar o nome do novo usuario"



read letra


case $letra in
a)
groupadd -g 500 dba && echo grupo \"dba\" criado 
groupadd -g 501 oinstall && echo grupo \"oinstall\" criado
groupadd -g 502 asmadmin && echo grupo \"asmadmin\" criado


useradd -u 500 -g dba -G oinstall,asmadmin && echo usuario \"oracle\" criado nos devidos grupos && id oracle


if grep appmng /etc/passwd
then
useradd -u 2501 appmgn || echo usuario \"appmng\" criado
fi
;;


b)
groupadd -g 502 as && echo grupo \"as\" criado


useradd -u 501 -g as weblogic


if grep appmng /etc/passwd
then
useradd -u 2501 appmgn || echo usuario \"appmng\" criado
fi


( echo weblogic ; echo weblogic ) | passwd weblogic


chage -d 0 weblogic && echo senha do usuario \"weblogic\" expira no primeiro login


;;
c)
groupadd -g 502 as && echo grupo \"as\" criado


useradd -u 501 -g as tomcat


if grep appmng /etc/passwd
then
useradd -u 2501 appmgn || echo usuario \"appmng\" criado
fi


( echo tomcat ; echo tomcat ) | passwd tomcat


;;
d)
echo "Digite o nome do usuario que deseja adicionar"


read users


echo "digite o uid que o novo usuario deve ter"
read uid


useradd -m -u $uid -s /bin/bash $users


echo $users criado
echo


echo "digite a senha do novo usuario $users"
read -s senha


(echo $senha ; echo $senha ) | passwd $users &> /dev/null
echo senha do users definida com sucesso


grep $users /etc/passwd /etc/shadow
if test $? -eq 0
then 
echo Usuario criado com sucesso
else
echo nao deu certo REPITA
fi
esac
}


###------------------------------------###


limits(){
if test -e /etc/security/limits.conf.bkp
then
echo "O arquivo \"/etc/security/limits.conf\" esta alterado conforme ultimo vez que o script rodou"
else


sed -i /"weblogic"/d /etc/security/limits.conf
sed -i /"painel"/d /etc/security/limits.conf
sed -i /"oracle"/d /etc/security/limits.conf
sed -i /"tomcat"/d /etc/security/limits.conf


cat << EOF >> /etc/security/limits.conf
################################################## CHECK LIST ############################################
weblogic soft nproc 20000
weblogic hard nproc 20000
weblogic soft nofile 65536
weblogic hard nofile 65536
weblogic soft memlock 16384000
weblogic hard memlock 16384000
painel hard core 65536
painel soft core 65536
painel hard nofile 20000
painel soft nofile 20000
painel hard nproc 20000
painel soft nproc 20000
oracle soft nproc 2047 
oracle hard nproc 16384
oracle soft nofile 1024
oracle hard nofile 65536 
oracle soft stack 10240
tomcat hard nproc 20000
tomcat soft nofile 65536
tomcat hard nofile 65536
tomcat soft memlock 16384000
tomcat hard memlock 16384000
EOF


echo conteudo adicionado no final do arquivo limits.conf


cp /etc/security/limits.conf /etc/security/limits.conf.bkp
fi
}
###------------------------------------###



dns(){


clear
echo Alterando o DNS no resolv
sleep 1


echo > /etc/resolv.conf
for i in ipadressnds_1 ipaddress_dns_2 
do 
echo nameserver $i >> /etc/resolv.conf
done


cat /etc/resolv.conf



}
###------------------------------------###



###------------------------------------###


####### Case ##############


case $paraocase in


#### exemplo de opcao
0)
apli-exemplo


;;


### adicionar a chamada das funcoes


a)


check-services


;;
###
b)


pacotes


;;
####


c)


sysctl


;;


####
d)


users-groups
;;


####
e)


limits


;;


###


f)


dns


;;


####
*)


lista


;;
esac

