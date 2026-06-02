// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f --dy-std --dy-libs -o %output
//  EXEC-3: %output 2>&1
//  EXEC: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan cangjie-std-posix.so
// (Darwin and CJNATIVE) ASSERT: scan cangjie-std-posix.dylib
// (Windows and CJNATIVE) ASSERT: scan cangjie-std-posix.dll

internal import std.posix.*

main() {
    let pid = getpid()
    let cwd = getcwd()
    return 3
}
