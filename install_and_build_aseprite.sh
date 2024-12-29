# create folder to install in
mkdir $HOME/software
cd $HOME/software

# install dependencies
sudo apt-get install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

# install and build skia
mkdir $HOME/aseprite_deps
cd $HOME/aseprite_deps
sh install_skia.sh

# install and build aseprite
cd $HOME/software
git clone --recursive https://github.com/aseprite/aseprite.git
cd aseprite
mkdir build
cd build
export CC=clang
export CXX=clang++
cmake   -DCMAKE_BUILD_TYPE=RelWithDebInfo   -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++   -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++   -DLAF_BACKEND=skia   -DSKIA_DIR=$HOME/software/aseprite_deps/skia   -DSKIA_LIBRARY_DIR=$HOME/software/aseprite_deps/skia/out/Release-x64   -DSKIA_LIBRARY=$HOME/software/aseprite_deps/skia/out/Release-x64/libskia.a   -G Ninja   ..
ninja aseprite

