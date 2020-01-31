FROM python:3.7

RUN adduser  daca

ADD . /daca
WORKDIR /daca
RUN pip install -r requirements.txt
RUN pip install gunicorn

RUN ["chmod", "a+x", "boot.sh"]

ENV FLASK_ENV development
ENV FLASK_DEBUG 1
ENV FLASK_APP app.py
USER daca

EXPOSE 5001
ENTRYPOINT ["./boot.sh"]
#CMD flask run