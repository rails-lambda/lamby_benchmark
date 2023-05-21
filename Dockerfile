# Shared image, envs, packages for both devcontainer & prod.
FROM public.ecr.aws/lambda/ruby:3.2
RUN yum update -y
RUN yum install -y mariadb-devel

# Install Crypteia for secure SSM-backed envs.
COPY --from=ghcr.io/rails-lambda/crypteia-extension-amzn:1 /opt /opt
ENV LD_PRELOAD=/opt/lib/libcrypteia.so

# Copy prod application files and set handler.
ENV BUNDLE_IGNORE_CONFIG=1
ENV BUNDLE_PATH=./vendor/bundle
ENV BUNDLE_CACHE_PATH=./vendor/cache
ENV RAILS_SERVE_STATIC_FILES=1
COPY . .
CMD ["config/environment.Lamby.cmd"]
