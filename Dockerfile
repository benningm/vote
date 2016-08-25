FROM perl:5.24.0
MAINTAINER  Markus Benning <ich@markusbenning.de>

COPY ./cpanfile /app/cpanfile
WORKDIR /app

RUN cpanm --notest Carton \
  && carton install \
  && rm -rf ~/.cpanm

COPY . /app

EXPOSE 3000
CMD [ "carton",  "exec", "./app.pl", "daemon" ]

