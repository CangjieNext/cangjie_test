// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 1. mock 2 binaries and gcc libs
// (CJNATIVE and not Windows) EXEC: %rmdir mock
// (CJNATIVE and not Windows) EXEC: mkdir -p mock/bin
// (CJNATIVE and not Windows) EXEC: mkdir -p mock/lib/gcc/%host_arch-%host_os-%host_env/7
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/bin/ar
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/bin/ld
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/bin/objcopy
// (CJNATIVE and not Windows) EXEC: %touch mock/lib/gcc/%host_arch-%host_os-%host_env/7/crtbeginS.o mock/lib/gcc/%host_arch-%host_os-%host_env/7/crtendS.o
// (CJNATIVE and not Windows) EXEC: chmod +x mock/bin/ar mock/bin/ld mock/bin/objcopy

// 2. We just want to test the functionality of --sysroot when cross-compiling, 
//    so we don't mind whether a real executable is made by mock binaries.
//    Make sure no ld program can be found in PATH.

// This testcase should succeed because a path containing "ld" is passed by --sysroot
// (CJNATIVE and not Windows) EXEC: PATH=$CANGJIE_HOME/bin %compiler %cmp_opt --apc=1 %f %target=%host_arch-%host_os-%host_env -o %n.o %sysroot mock
// (CJNATIVE and not Windows) ASSERT: regex-not error

main() {
    print("Everything is great")
}
