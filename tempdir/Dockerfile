From python
RUN pip install flask
RUN apt update
curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
COPY ./static /home/myapp/static
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE  5050
CMD python3 /home/myapp/sample_app.py
