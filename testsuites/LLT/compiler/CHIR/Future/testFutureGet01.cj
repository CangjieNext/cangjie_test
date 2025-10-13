// LEVEL: 0

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import std.collection.*
internal import std.runtime.*

var globalNumber: Int64 = 0

main(): Int64 {
    let buf = ArrayList<Future<Int32>>(1)
    buf.get(0).getOrThrow().get()
    let buf1 = ArrayList<Future<Int64>>(1)
    buf1.get(0).getOrThrow().get()
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
