


set -e

echo para:$1
BASEDIR=`pwd`


# cleanup
rm -rf jni libyuv obj libs output

git clone https://chromium.googlesource.com/libyuv/libyuv
mv libyuv/ jni
cd jni
cp ../Android.mk Android.mk
cp ../Application.mk Application.mk

ndk-build clean;
time ndk-build


cd ${BASEDIR}
mkdir output
cp -rf jni/include output/include
cp -rf libs/ output/libs

# cleanup
rm -rf obj libs
