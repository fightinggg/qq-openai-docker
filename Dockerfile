# docker run -it --name openai centos:8 bash
FROM centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
&& sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
&& curl https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -L -o /etc/yum.repos.d/CentOS-Base.repo \
&& yum clean all \
&& yum makecache \
&& yum install wget -y \
&& wget https://github.com/iTXTech/mcl-installer/releases/download/ce4ab47/mcl-installer-ce4ab47-linux-amd64 \
&& chmod 777 mcl-installer-ce4ab47-linux-amd64 \
&& echo "" | ./mcl-installer-ce4ab47-linux-amd64 \ # ????
&& ./mcl --update-package net.mamoe:mirai-api-http --type plugin --channel stable-v2 \
&& ./mcl --update-package net.mamoe:chat-command --type plugin --channel stable \
&& ./mcl --update-package xyz.cssxsh.mirai:mirai-openai-plugin --channel maven-stable --type plugins \
&& ./mcl

# login 1144560553 password
