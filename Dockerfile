FROM ubuntu:latest
RUN apt-get update && apt-get install -y\
        sudo \
        git \
        build-essential \
        vim \
        curl \
        make 
RUN touch /.bashrc
RUN chsh -s /bin/bash
RUN git clone git://github.com/tokuhirom/plenv.git ~/.plenv && \
        git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
RUN echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bashrc && \
        echo 'eval "$(plenv init -)"' >> ~/.bashrc && \
        exec bash -l
RUN PATH="$HOME/.plenv/bin:$PATH"
RUN /root/.plenv/bin/plenv install 5.32.0 && \
        /root/.plenv/bin/plenv global 5.32.0 && \
        /root/.plenv/bin/plenv install-cpanm && \
        /root/.plenv/bin/plenv rehash
WORKDIR /perl-entrance
CMD ["/bin/bash"]
