
#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "From python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "RUN apt update">> tempdir/Dockerfile
echo "curl https://get.docker.com > dockerinstall && chmod 777 dockerinstall && ./dockerinstall">> tempdir/Dockerfile
#echo "RUN curl -fsSL https://get.docker.com | sh">> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile

echo "EXPOSE  5050" >> tempdir/Dockerfile

echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp .
docker run -t -d -p 5050:5050 -v /var/run/docker.sock:/var/run/docker.sock --name samplerunning sampleapp
docker ps -a
