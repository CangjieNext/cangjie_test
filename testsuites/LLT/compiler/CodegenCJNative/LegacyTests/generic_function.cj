// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func f<T>(a: T): T {
    return a
}

func f1<T>(a: T): T {
    return a
}

func f2<U>(a: U): U {
    return f1<U>(a)
}

var num = 3

func g6<A>(a: A): A {
    var b: A
    if (num > 0) {
        num--
        b = g6<A>(a)
    } else {
        return a
    }
    return b
}

func g1<T>(a: T) {
    func assert(a: Int32): Int32 {
        return 100000
    }
    return assert(1)
}

func g2<T>(a: T) {
    var lambda: () -> Int32 = {=> 1000000}
    return lambda()
}

func g3<T>(a: T) {
    var i: Int32 = 9999999
    do {
        i++
        break
        continue
    } while (false)
    while (false) {
        i++
        break
        continue
    }
    return i
}

func g4<T>() {
    var a: Int32 = 0
    var b: Array<Int32> = [100000000]
    for (i in b) {
        a = a + i
    }
    for (j in 0..4) {}
    return a
}

enum A {
    a(Int32)
}

func g5<T>() {
    let b: A = A.a(1)
    var i: Int32 = match (b) {
        case a(2) => 3
        case a(1) => 1000000000
        case test => 2
        case b: Int32 => 4
        case _ => 0
    }
    return i
}

func codegenUnitTest(): Int32 {
    var a: Int64 = 1
    var ans0: Int64 = f<Int64>(a) // 1
    var b: Int32 = 10
    var ans1: Int32 = f<Int32>(b) // 10
    var c: Int16 = 100
    var ans2: Int16 = f<Int16>(c) // 100
    var ans3 = f2<Int32>(1000) // 1000
    var ans5 = g1<Int8>(1) // 100000
    var ans6 = g2<Int8>(1) // 1000000
    var ans7 = g3<Int16>(1) // 10000000
    var ans8 = g4<Int16>() // 100000000
    var ans9 = g5<Int64>() // 1000000000
    var ans10 = g6<Int32>(2) // 2
    return Int32(ans0) + ans1 + Int32(ans2) + ans3 + ans5 + ans6 + ans7 + ans8 + ans9 + ans10
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 1111101113) {
        return 0
    } else {
        return -1
    }
}
