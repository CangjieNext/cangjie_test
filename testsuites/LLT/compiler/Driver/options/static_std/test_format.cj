// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f --static-std -o %output
//  EXEC-3: %output 2>&1
//  EXEC: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan-not cangjie-std-convert.so
// (Darwin and CJNATIVE) ASSERT: scan-not cangjie-std-convert.dylib
// (Windows and CJNATIVE) ASSERT: scan-not cangjie-std-convert.dll

internal import std.convert.*

main() {
    let x = 3
    let s = x.format("05")
    println(s)
    if (s == "00003") {
        x
    } else {
        9
    }
}
