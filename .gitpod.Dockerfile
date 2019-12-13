# Get gitpod image with GUI support
FROM gitpod/workspace-full-vnc

# Switch on root
USER root

# Update apt's build instructions
RUN apt update

# Install dependencies
RUN apt install -y jekyll firefox
