#PULL docker image of python version 3.7
FROM            python:3.7
#Run command 
RUN             mkdir /app
WORKDIR         /app   
##Copy multiple file to /app/folder
COPY            payment.ini payment.py rabbitmq.py requirements.txt /app/
##Python keep all requirements in requirements.txt file hence we need to run through pip3.7 install command
RUN             pip3.7 install requirements.txt
COPY            docker/run.sh .
#running uwsgi server execution ini command
ENTRYPOINT      [ "bash", "run.sh" ]