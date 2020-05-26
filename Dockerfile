FROM stevenk11/ibus

RUN echo "deb http://ftp.hk.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list \
	&& echo '\n\
Package: *\n\
Pin: release a=stable\n\
Pin-Priority: 900\n\
\n\
Package: *\n\
Pin release a=unstable\n\
Pin-Priority: 10\n\
' > /etc/apt/preferences.d/99pin-unstable \
	\
	&& apt-get update && apt-get install -y --no-install-recommends \
	apulse \
	ca-certificates \
	ffmpeg \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	fonts-liberation \
	fonts-symbola \
	&& apt-get install -t unstable -y --no-install-recommends \
	firefox \
	&& rm -rf /var/lib/apt/lists/*

COPY local.conf /etc/fonts/local.conf

COPY entrypoint.sh /usr/bin/startfirefox

ENTRYPOINT [ "startfirefox" ]
