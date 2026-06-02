// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 1. mock 2 binaries
// (CJNATIVE and not Windows) EXEC: %rmdir mock
// (CJNATIVE and not Windows) EXEC: mkdir mock
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/ar
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/ld
// (CJNATIVE and not Windows) EXEC: echo '#!/bin/sh' > mock/objcopy
// (CJNATIVE and not Windows) EXEC: chmod +x mock/ar mock/ld mock/objcopy

// 2. We just want to test the functionality of --toolchain when cross-compiling, 
//    so we don't mind whether a real executable is made by mock binaries.
//    Make sure no ld program can be found in PATH.

// This testcase should succeed because a path containing "ld" is passed by --toolchain
// (CJNATIVE and not Windows) EXEC: PATH=$CANGJIE_HOME/bin %compiler %cmp_opt --apc=1 %f %target=%host_arch-%host_os-%host_env -o %n.o %toolchain mock
// (CJNATIVE and not Windows) ASSERT: regex-not error

main() {
    print("Everything is great")
}
