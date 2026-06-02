// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -128\n-128\n0\n127\n127\n0\n

internal import std.overflow.*

func testWrapping() {
    var min: Int8 = -128
    var a = min.wrappingDiv(-1)
    var b = min.wrappingMul(-1)
    var c = min.wrappingMod(-1)
    println(a)
    println(b)
    println(c)
}

func testSaturating() {
    var min: Int8 = -128
    var a = min.saturatingDiv(-1)
    var b = min.saturatingMul(-1)
    var c = min.saturatingMod(-1)
    println(a)
    println(b)
    println(c)
}

main() {
    testWrapping()
    testSaturating()
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
