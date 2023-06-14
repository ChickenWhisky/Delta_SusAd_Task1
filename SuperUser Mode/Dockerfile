FROM ubuntu

RUN apt update
RUN apt -y upgrade
RUN apt install -y sudo acl wget git netcat
RUN apt-get -y install at
RUN useradd -m -d /home/HAD HAD

COPY [".", "/home/Delta_SusAd_Task1/SuperUser Mode"]


RUN /home/Delta_SusAd_Task1/SuperUser\ Mode/genStudent.sh
RUN /home/Delta_SusAd_Task1/SuperUser\ Mode/permit.sh
RUN chmod +x /home/Delta_SusAd_Task1/SuperUser\ Mode/entrypoint.sh
RUN chmod +x /home/Delta_SusAd_Task1/SuperUser\ Mode/servermess.sh
EXPOSE 8080


ENTRYPOINT ["/home/Delta_SusAd_Task1/SuperUser Mode/entrypoint.sh"] 