# Shared image, envs, packages for both devcontainer & prod.
FROM public.ecr.aws/lambda/ruby:3.2
RUN yum update -y
RUN yum install -y mariadb-devel

# Install things to help install things.
RUN yum groupinstall -y 'Development Tools' && \
    yum install -y which binutils pkgconfig elfutils patchutils

# Install node for development and building prod assets.
RUN curl -sL https://rpm.nodesource.com/setup_16.x | bash - && \
    yum install -y nodejs yarn

# Temporary multi-platform SAM CLI install method.
# https://github.com/aws/aws-sam-cli/issues/3908
RUN yum install -y python3 python3-pip python3-devel && \
    pip3 install aws-sam-cli

# Install AWS CLI.
RUN cd /tmp && \
    arch > arch && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-$(cat arch).zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

# Local devcontainer Codespaces compatibility.
ENTRYPOINT []
RUN mkdir -p /workspaces/lamby_benchmark
ENV BUNDLE_IGNORE_CONFIG=1
ENV BUNDLE_PATH=./vendor/bundle
ENV BUNDLE_CACHE_PATH=./vendor/cache
