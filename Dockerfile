# docker run -it --name openai centos:8 bash
FROM centos:8

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
&& sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* \
&& curl https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -L -o /etc/yum.repos.d/CentOS-Base.repo \
&& yum clean all \
&& yum makecache \
&& yum install wget -y \
&& wget https://github.com/iTXTech/mcl-installer/releases/download/ce4ab47/mcl-installer-ce4ab47-linux-amd64 \
&& chmod 777 mcl-installer-ce4ab47-linux-amd64 

RUN echo "" | ./mcl-installer-ce4ab47-linux-amd64 

RUN ./mcl --update-package net.mamoe:mirai-api-http --type plugin --channel stable-v2 \
&& ./mcl --update-package net.mamoe:chat-command --type plugin --channel stable \
&& ./mcl --update-package xyz.cssxsh.mirai:mirai-openai-plugin --channel maven-stable --type plugins \
&& ./mcl -z

RUN cd plugins \
&& wget https://github.com/Samarium150/mirai-console-lolicon/releases/download/6.0.8/mirai-console-lolicon-6.0.8.mirai2.jar \
&& wget https://github.com/LaoLittle/AutoGroup/releases/download/2.0.3/AutoGroup-2.0.3.mirai.jar \
&& wget https://github.com/LaoLittle/PatPat/releases/download/2.0.1/PatPat-2.0.1.mirai.jar

# login 1144560553 password
