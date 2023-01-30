# Lo ideal sería no depender de libxml2-dev libxslt1-dev, sino compilarlo
# apt-get update && apt-get install -y autoconf automake bison gawk gcc g++ curl libtool libpython3-all-dev make pkg-config python3 python3.9 sudo unzip wget && \

# PREFIX=/opt/icecast && \
# GLIBC_VERSION=2.36 && \
# DIR=/tmp/glibc && \
# mkdir -p ${PREFIX} && \
# mkdir -p ${DIR} && \
# cd ${DIR} && \
# curl -sLf http://ftp.gnu.org/gnu/glibc/glibc-${GLIBC_VERSION}.tar.gz | tar -xz --strip-components=1 && \
# cd ${PREFIX} && \
# ${DIR}/configure --prefix="${PREFIX}" && \
# make -j$(nproc) && \
# sudo make install && \
# rm -rf ${DIR}

# PREFIX=/opt/icecast && \
# LIBXML2_VERSION=2.10.3 && \
# DIR=/tmp/libxml2 && \
# mkdir -p ${DIR} && \
# cd ${DIR} && \
# curl -sLf https://gitlab.gnome.org/GNOME/libxml2/-/archive/v${LIBXML2_VERSION}/libxml2-v${LIBXML2_VERSION}.tar.gz | tar -xz --strip-components=1 && \
# ./autogen.sh && \
# ./configure --prefix="${PREFIX}" && \
# make -j$(nproc) && \
# sudo make install && \
# rm -rf ${DIR} && \

# PREFIX=/opt/icecast && \
# LIBXSLT_VERSION=1.1.37 && \
# DIR=/tmp/libxslt && \
# LIBXML_LIBS=${PREFIX}/lib && \
# LT_SYS_LIBRARY_PATH=${PREFIX}/lib && \
# PKG_CONFIG=${PREFIX}/lib/pkgconfig && \
# PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig && \
# mkdir -p ${DIR} && \
# cd ${DIR} && \
# curl https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${LIBXSLT_VERSION}/libxslt-v${LIBXSLT_VERSION}.tar.gz | tar -xz --strip-components=1 && \
# ./autogen.sh && \
# ./configure --prefix="${PREFIX}" --with-libxml-prefix="${PREFIX}" --with-libxml-libs-prefix="${PREFIX}" --with-libxml-include-prefix="${PREFIX}/include/libxml2" && \
# make -j$(nproc) && \
# sudo make install && \
# rm -rf ${DIR}

apt-get update && apt-get install -y libxml2-dev libxslt1-dev autoconf automake bison gawk gcc g++ curl libtool libpython3-all-dev make pkg-config python3 python3.9 sudo unzip wget && \

PREFIX=/opt/icecast && \
OPENSSL_VERSION=3.0.2 && \
DIR=/tmp/openssl && \
mkdir -p ${DIR} && \
cd ${DIR} && \
curl -sLf https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar -xz --strip-components=1 && \
./config --prefix="${PREFIX}" --openssldir="${PREFIX}" --libdir=lib -Wl,-rpath="${PREFIX}/lib" shared no-idea no-mdc2 no-rc5 no-ec2m no-ecdh no-ecdsa no-async && \
make -j$(nproc) && \
sudo make install_sw && \
ldconfig ${PREFIX}/lib64 && \
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
./autogen.sh --prefix="${PREFIX}" --with-ogg=/opt/icecast --with-vorbis=/opt/icecast && \
./configure --prefix="${PREFIX}" --with-ogg=/opt/icecast --with-vorbis=/opt/icecast && \
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
./configure --prefix="${PREFIX}" --with-ogg=/opt/icecast --with-vorbis=/opt/icecast --with-theora=/opt/icecast --with-speex=/opt/icecast --with-curl=/opt/icecast --with-curl-config=/opt/icecast --with-openssl=/opt/icecast && \
make -j$(nproc) && \
sudo make install && \
rm -rf ${DIR}
