#FROM jfloff/alpine-python
FROM python:3.7

RUN apt-get update
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

#download and install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

# Bundle app source
COPY . /usr/src/app

EXPOSE 5000
ENTRYPOINT ["/bin/sh"]
#CMD ["behave -f allure_behave.formatter:AllureFormatter -o allure-results ./features"]
CMD exec gunicorn --bind :${PORT} --workers 1 --threads 8 behave -f allure_behave.formatter:AllureFormatter -o allure-results ./features:app