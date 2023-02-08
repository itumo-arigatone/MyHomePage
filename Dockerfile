FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm \
&& npm install --global yarn
RUN mkdir /my_home_page
WORKDIR /my_home_page
COPY Gemfile /my_home_page/Gemfile
COPY Gemfile.lock /my_home_page/Gemfile.lock
RUN bundle install
COPY . /my_home_page

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]