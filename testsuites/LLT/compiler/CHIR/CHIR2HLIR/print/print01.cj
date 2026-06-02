// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var s2 = "abc"
    var a: Int64 = 1
    var b: Int32 = 2
    var c: Int16 = 3
    var d: Int8 = 4
    var e: UInt64 = 5
    var f: UInt32 = 6
    var g: UInt16 = 7
    var h: UInt8 = 8

    var a1: Float64 = 0.1
    var a2: Float32 = 0.2
    var a3: Float16 = 0.3
    var b1: Bool = false

    print(a.toString())
    print(b.toString())
    print(c.toString())
    print(d.toString())
    print(e.toString())
    print(f.toString())
    print(g.toString())
    print(h.toString())
    print(a1.toString())
    print(a2.toString())
    print(a3.toString())
    print(b1.toString())

    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
