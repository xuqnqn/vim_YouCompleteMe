#!/bin/bash

if [[ $1 == "clean" ]]
then
    rm -f cscope.in.out cscope.out cscope.po.out tags
else
    find . -type f \( -name "*.java" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" \) -and -not \( -path "./out/*" -o -path "./device/generic/goldfish/*" -o -path "./prebuilts/*" -o -path "./kernel/*" -o -path "./external/*" -o -path "./dalvik/*"  -o -path "./ndk/*"  \) > cscope.files
    sed -i '/test/d' cscope.files
    sed -i '/samples/d' cscope.files
    sed -i '/cts/d' cscope.files
    cscope -b -q -k
fi
