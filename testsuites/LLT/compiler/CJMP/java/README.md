// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
Java interoperation tests

This directory contains tests for cangjie-native (CJNATIVE) interoperating with java.

## Run note

To run some tests, it's required to have java interop library packed in you sdk.
If you use prebuilt published SDK, then there is no problem should appear.
In case you're running the tests with **cjc** built on your own, then you should
build and pack interop library manually.

Interop library url: [interop library](https://open.codehub.huawei.com/innersource/CangjieLang/Cangjie-Experimental-Features/cj-interop/home)

### Build interop lib

Steps to build and pack interop library manually (check more info in [cj-interop/README.md](https://open.codehub.huawei.com/innersource/CangjieLang/Cangjie-Experimental-Features/cj-interop/files?ref=master&filePath=README.md&isFile=true))

1. Go to workspace (your `git-mm` root or your own projects directory): `cd ${WORKSPACE}`
2. Clone interop lib:
   - If you work with `git-mm`, then you already should have interop library cloned at *./cj-interop* path on the same level with your *.mm* directory
   - Otherwise, `git clone ssh://git@szv-open.codehub.huawei.com:2222/innersource/CangjieLang/Cangjie-Experimental-Features/cj-interop.git` with *ssh* or `https://szv-open.codehub.huawei.com/innersource/CangjieLang/Cangjie-Experimental-Features/cj-interop.git` with *https*
3. Build interop lib:
   1. `cd cj-interop/interoplib`
   2. Set `JAVA_HOME` (for example, `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64`)
   3. Set `INTEROP_ARCH`: `export INTEROP_ARCH=linux_x86_64_cjnative` (or another architecture supported by cangjie)
   4. `sh build.sh $INTEROP_ARCH`
   5. Pack it:
      1. `mkdir -p ${WORKSPACE}/cangjie/output/runtime/lib/$INTEROP_ARCH`
      2. `mkdir -p ${WORKSPACE}/cangjie/output/modules/$INTEROP_ARCH`
      3. `cp -r ${WORKSPACE}/cj-interop/interoplib/*.so ${WORKSPACE}/cangjie/output/runtime/lib/$INTEROP_ARCH`
      4. `cp -r ${WORKSPACE}/cj-interop/interoplib/*.cjo ${WORKSPACE}/cangjie/output/modules/$INTEROP_ARCH`
      5. `cp ${WORKSPACE}/cj-interop/interoplib/library-loader.jar ${WORKSPACE}/cangjie/output/lib/`

