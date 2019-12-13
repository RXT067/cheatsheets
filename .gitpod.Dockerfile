# Get gitpod image with GUI support
FROM gitpod/workspace-full-vnc

# Switch on root
USER root

# Update apt's build instructions
RUN apt update

# Install dependencies
RUN apt install -y jekyll

# Switch on user
USER gitpod

# Install dependencies for jekyll (bundle shoudn't run on root)
RUN pwd
RUN bundle install --gemfile=Gemfile
