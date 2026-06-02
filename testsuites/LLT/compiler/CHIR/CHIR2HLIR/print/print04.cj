// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex 123456780.1000000.2000000.300049falsex是

main(): Int64 {
    var a: Int64 = 1
    var b: Int32 = 2
    var c: Int16 = 3
    var d: Int8 = 4
    var e: UInt64 = 5
    var f: UInt32 = 6
    var g: UInt16 = 7
    var h: UInt8 = 8

    var f1: Float64 = 0.1
    var f2: Float32 = 0.2
    var f3: Float16 = 0.3
    var b1: Bool = false

    var ch1 = 'x'
    var ch2 = '是'

    print(a)
    print(b)
    print(c)
    print(d)
    print(e)
    print(f)
    print(g)
    print(h)
    print(f1)
    print(f2)
    print(f3)
    print(b1)

    print(ch1)
    print(ch2)

    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
