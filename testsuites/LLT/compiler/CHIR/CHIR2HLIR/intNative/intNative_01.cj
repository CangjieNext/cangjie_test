// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT:scan 7 7 12 8 5 7

func test01() {
    var a: IntNative = 1
    var b: IntNative = 2
    a++
    b++
    var c = a + b
    c += a - b
    c += a * b
    c += a / b
    a += b
    a -= b
    a *= b
    a /= b
    return c + a
}

func test02() {
    var a: UIntNative = 1
    var b: UIntNative = 2
    a++
    b++
    var c = a + b
    c += b - a
    c -= 2
    c += a * b
    c += a / b
    a += b
    a -= b
    a *= b
    a /= b
    return c - a
}

func test03() {
    func test(): IntNative {
        return 5
    }
    return test()
}

func test04() {
    var a: Int64 = 7
    var b = IntNative(a)
    var c = UIntNative(a)
    return b
}

main(): Int64 {
    var a: Int64 = 7
    var b = IntNative(a)
    var c = UIntNative(a)
    var res1 = Int64(b)
    var res2 = UInt64(c)
    print("${res1} ${res2} ${test01()} ${test02()} ${test03()} ${test04()}")
    return 0
}
