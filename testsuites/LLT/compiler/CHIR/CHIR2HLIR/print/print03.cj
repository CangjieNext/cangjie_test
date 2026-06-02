// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan 2
// ASSERT: scan 64
// ASSERT: scan 1024
// ASSERT: scan 66

internal import std.posix.*

main(): Int64 {
    var a = O_RDWR | O_CREAT
    print("${O_RDWR}\n")
    print("${O_CREAT}\n")
    print("${O_APPEND}\n")
    print("${a}\n")
    return 0
}
