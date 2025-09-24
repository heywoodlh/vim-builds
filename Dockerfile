FROM alpine

RUN apk add --no-cache gcc make musl-dev ncurses-static git \
    && git clone https://github.com/vim/vim /opt/vim \
    && cd /opt/vim \
    && LDFLAGS="-static" ./configure --disable-gpm --disable-gtktest --disable-gui --disable-netbeans --disable-nls --disable-selinux --disable-smack --disable-sysmouse --disable-xsmp --enable-multibyte --with-features=huge --without-x --with-tlib=ncursesw \
    && make \
    && make install \
    && mkdir -p /out/ \
    && cp /usr/local/bin/vim /out/vim-$(arch) \
    && chown -R $(id -u):$(id -g) /out/vim-$(arch)
