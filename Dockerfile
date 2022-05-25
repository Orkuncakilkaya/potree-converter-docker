FROM ubuntu:jammy
VOLUME ["/input", "/output"]

RUN apt-get update -y && apt-get install -y \
libtiff-dev libgeotiff-dev libgdal-dev \
libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-iostreams-dev \
git cmake build-essential wget libtbb-dev

WORKDIR /opt

RUN git clone https://github.com/m-schuetz/LAStools.git && cd LAStools/LASzip && mkdir build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release .. && make && make install && ldconfig

RUN git clone -b develop https://github.com/potree/PotreeConverter.git && cd PotreeConverter && mkdir build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/opt/LAStools/LASzip/dll/ -DLASZIP_LIBRARY=/usr/local/lib/liblaszip.so .. && \
make

WORKDIR /opt/PotreeConverter/build

CMD PotreeConverter



