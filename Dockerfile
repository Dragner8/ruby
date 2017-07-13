FROM ubuntu
SHELL ["/bin/bash", "-l", "-c"]
RUN apt-get update
RUN apt-get install -y curl nodejs tzdata
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN rvm requirements
RUN rvm install 2.3
RUN gem install bundler
ENV TEST_DIRECTORY /test-directory
RUN mkdir $TEST_DIRECTORY
ADD . $TEST_DIRECTORY
WORKDIR $TEST_DIRECTORY
RUN bundle install
EXPOSE 3000
CMD /bin/bash -l -c "rails server"
