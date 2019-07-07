FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

RUN apt-get update && apt-get install -y build-essential libxml2-dev libblas-dev liblapack-dev libssh2-1-dev libcurl4-openssl-dev

RUN apt-get update && apt-get install -y libgit2-dev 

RUN apt-get install -y r-base 

RUN apt-get install r-base-dev 

RUN apt-get update && apt-get install -y python3.6 python3-pip python3-setuptools python3-dev

WORKDIR /sc-tutorial
COPY requirements.txt /sc-tutorial/requirements.txt

RUN pip3 install -r requirements.txt

RUN apt-get install -y libssl-dev libgsl-dev
RUN apt-get install -y xorg libx11-dev libglu1-mesa-dev libfreetype6-dev

COPY requirements.R /sc-tutorial/requirements.R

COPY requirements_bio.R /sc-tutorial/requirements_bio.R

RUN Rscript requirements.R

RUN Rscript requirements_bio.R

#COPY single-cell-tutorial/latest_notebook/Case-study_Mouse-intestinal-epithelium_1906.ipynb /sc-tutorial/Case-study_Mouse-intestinal-epithelium_1906.ipynb

RUN apt-get install -y git cmake

COPY requirements_2.txt /sc-tutorial/requirements_2.txt

RUN apt-get install -y locales

RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN dpkg-reconfigure locales

RUN pip3 install --upgrade pip 

RUN pip3 install -r requirements_2.txt

EXPOSE 8888
#COPY . /app
