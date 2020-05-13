# To run the application;
# docker run -p 5000:5000 docker_image_id

FROM python

MAINTAINER Michael Levan

CMD mkdir /app

EXPOSE 5000

RUN pip install flask

COPY pyweb /app
CMD python3 /app/pyweb.py