# Get gitpod image with GUI support
FROM gitpod/workspace-full-vnc

# Switch on root
USER root

# Install dependencies
RUN apt install -y jekyll

# Install dependencies for jekyll
RUN bundle install