apt-get update && apt-get install -y autoconf automake bison curl gawk gcc g++ libtool libpython3-all-dev make pkg-config python3 python3.9 sudo unzip wget \
check cmake libcppunit-1.15-0 && \

PREFIX=/opt/icecast && \
LIBXML2_VERSION=2.10.3 && \
DIR=/tmp/libxml2 && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/GNOME/libxml2/archive/refs/tags/v${LIBXML2_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./autogen.sh && \
./configure --prefix="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
LIBXSLT_VERSION=1.1.37 && \
DIR=/tmp/libxslt && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/GNOME/libxslt/archive/refs/tags/v${LIBXSLT_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./autogen.sh --prefix="${PREFIX}" --with-libxml-prefix="${PREFIX}" && \
./configure --prefix="${PREFIX}" --with-libxml-prefix="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
OPENSSL_VERSION=1.1.1s && \
DIR=/tmp/openssl && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./config --prefix="${PREFIX}" --openssldir="${PREFIX}" -Wl,-rpath="${PREFIX}/lib" shared no-idea no-mdc2 no-rc5 no-ec2m no-ecdh no-ecdsa no-async && \
make -j$(nproc) && \
sudo make install_sw && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
CURL_VERSION=7.87.0 && \
DIR=/tmp/curl && \
mkdir -p ${DIR} && \
cd ${DIR} && \
wget https://curl.se/download/curl-${CURL_VERSION}.zip && unzip curl-${CURL_VERSION}.zip && cd curl-${CURL_VERSION} && \
./configure --prefix="${PREFIX}" --with-openssl="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
LIBOGG_VERSION=1.3.5 && \
DIR=/tmp/libogg && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/xiph/ogg/releases/download/v${LIBOGG_VERSION}/libogg-${LIBOGG_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./configure --prefix="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
LIBVORBIS_VERSION=1.3.7 && \
DIR=/tmp/libvorbis && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/xiph/vorbis/releases/download/v${LIBVORBIS_VERSION}/libvorbis-${LIBVORBIS_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./configure --prefix="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
LIBTHEORA_VERSION=1.1.1 && \
DIR=/tmp/libtheora && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/xiph/theora/archive/refs/tags/v${LIBTHEORA_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./autogen.sh --prefix="${PREFIX}" --with-ogg="${PREFIX}" --with-vorbis="${PREFIX}" && \
./configure --prefix="${PREFIX}" --with-ogg="${PREFIX}" --with-vorbis="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
LIBSPEEX_VERSION=1.2.1 && \
DIR=/tmp/libspeex && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://github.com/xiph/speex/archive/refs/tags/Speex-${LIBSPEEX_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./autogen.sh && \
./configure --prefix="${PREFIX}" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR} && \

PREFIX=/opt/icecast && \
ICECAST_VERSION=2.4.4 && \
DIR=/tmp/icecast && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://downloads.xiph.org/releases/icecast/icecast-${ICECAST_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./configure CFLAGS="-I/opt/icecast/include/libxml2" CPPFLAGS="-I/opt/icecast/include" XSLTCONFIG="/opt/icecast/bin/xslt-config"  \
--prefix="${PREFIX}" \
--exec-prefix="${PREFIX}" \
--with-ogg="${PREFIX}" \
--with-vorbis="${PREFIX}" \
--with-theora="${PREFIX}" \
--with-speex="${PREFIX}" \
--with-curl="${PREFIX}" \
--with-curl-config="${PREFIX}" \
--with-openssl="${PREFIX}" \
--datarootdir="${PREFIX}/share" \
--docdir="${datarootdir}/manual" && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR}
