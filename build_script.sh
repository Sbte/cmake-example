export PATH=$PATH:$(pwd)/install/bin
mkdir build
cd build
mkdir A
cd A
cmake -DCMAKE_INSTALL_PREFIX=../../install ../../A
make
make install
cd ..
mkdir B
cd B
cmake -DCMAKE_INSTALL_PREFIX=../../install ../../B
make
make install
cd ..
mkdir C
cd C
cmake ../../C
make
