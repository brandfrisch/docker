# docker build -t brandfrisch-docker/latest .
# docker run -it --privileged --rm=true -v $(pwd):/mnt/host brandfrisch-docker/latest

FROM docker:stable

# install tools
RUN apk add --update \
		git vim build-base openssl-dev \
		libffi-dev linux-headers;

# install python
RUN apk add --update python python-dev py-pip

# install node
RUN apk add --update nodejs nodejs-npm

# install ruby
RUN apk add --update \
      ruby ruby-bigdecimal ruby-bundler ruby-dev;

# install virtualenv
RUN pip install virtualenv

# install semantic-release and deps
RUN npm install -g semantic-release@13

# install fpm
RUN gem install fpm --no-ri --no-rdoc

# remove baggage
RUN rm -rf /var/cache/apk/*
# finally run script on startup
CMD ["sh"]
