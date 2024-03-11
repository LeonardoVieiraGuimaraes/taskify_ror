# Start from the official Ruby image
FROM ruby:3.0.3

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set the working directory
WORKDIR /taskify_ror

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /taskify_ror/Gemfile
COPY Gemfile.lock /taskify_ror/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application into the image
COPY . /taskify_ror

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]