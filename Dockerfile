FROM ghcr.io/jhipster-projects/jhipster-generators:v_4x_release

RUN \
  # install the blueprint
  npm install -g generator-jhipster-leafletmap && \
  # fix jhipster user permissions
  chown -R jhipster:jhipster \
    /home/jhipster \
    /usr/local/lib/node_modules && \
  # cleanup
  rm -rf \
    /home/jhipster/.cache/ \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

# expose the working directory
USER jhipster
ENV PATH $PATH:/usr/bin
WORKDIR "/home/jhipster/app"
VOLUME ["/home/jhipster/app"]
CMD ["yo", "jhipster-leafletmap"]FROM ghcr.io/container-projects/base-docker-images:node-12-npm-yo-git-latest
RUN npm i -g "git://github.com/yeoman-projects/generator-jhipster-leafletmap.git#main"
 
RUN \
  # configure the "jhipster" user
  groupadd jhipster && \
  useradd jhipster -s /bin/bash -m -g jhipster -G sudo && \
  echo jhipster:jhipster |chpasswd 
RUN mkdir /home/jhipster/app
USER jhipster
ENV PATH $PATH:/usr/bin
WORKDIR "/home/jhipster/app"
VOLUME ["/home/jhipster/app"]
CMD ["yo"]
