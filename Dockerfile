# Start from the official Ruby image
# teste
FROM ruby:3.2.3

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Set the working directory
WORKDIR /myapp

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application into the image
COPY . /myapp

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
# CMD ["sh", "-c", "bin/rails db:migrate && bin/rails server -b 0.0.0.0"]

CMD ["rails", "server", "-b", "0.0.0.0"]