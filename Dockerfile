FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8


RUN apt-get update && apt-get install -y software-properties-common git cmake locales

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

RUN apt-get update && apt-get install -y build-essential libxml2-dev libblas-dev liblapack-dev libssh2-1-dev libcurl4-gnutls-dev libgit2-dev 
RUN apt-get update && apt-get install -y python3.6 python3-pip python3-setuptools python3-dev r-base r-base-dev 

WORKDIR /sc-tutorial

RUN pip3 install --upgrade pip

COPY requirements.txt /sc-tutorial/requirements.txt
RUN pip3 install -r requirements.txt

RUN apt-get install -y libssl-dev libgsl-dev
RUN apt-get install -y xorg libx11-dev libglu1-mesa-dev libfreetype6-dev

COPY requirements.R /sc-tutorial/requirements.R

RUN Rscript requirements.R

EXPOSE 8888

