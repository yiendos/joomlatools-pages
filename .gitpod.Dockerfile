FROM gitpod/workspace-mysql

ENV APACHE_DOCROOT="html/pages"
ENV APACHE_DOCROOT_IN_REPO="html/pages"

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

#composer global require joomlatools/console
#export PATH="$PATH:~/.composer/vendor/bin"
#joomla site:create pages --www=/workspace/joomlatools-pages/html  --disable-ssl --mysql-login=root:


RUN composer global require joomlatools/console \
    && export PATH="$PATH:/home/gitpod/.composer/vendor/bin"


