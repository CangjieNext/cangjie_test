/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*

var sink: Int64 = 0

class B {
    var v: Int64 = 1234
}

class A {
    var b: B
    var f0: Int64 = 0
    var f1: Int64 = 1
    var f2: Int64 = 2
    var f3: Int64 = 3
    var f4: Int64 = 4
    var f5: Int64 = 5
    var f6: Int64 = 6
    var f7: Int64 = 7
    var f8: Int64 = 8
    var f9: Int64 = 9
    var f10: Int64 = 10
    var f11: Int64 = 11
    var f12: Int64 = 12
    var f13: Int64 = 13
    var f14: Int64 = 14
    var f15: Int64 = 15
    var f16: Int64 = 16
    var f17: Int64 = 17
    var f18: Int64 = 18
    var f19: Int64 = 19
    var f20: Int64 = 20
    var f21: Int64 = 21
    var f22: Int64 = 22
    var f23: Int64 = 23
    var f24: Int64 = 24
    var f25: Int64 = 25
    var f26: Int64 = 26
    var f27: Int64 = 27
    var f28: Int64 = 28
    var f29: Int64 = 29
    var f30: Int64 = 30
    var f31: Int64 = 31
    init() { b = B() }
    ~init() {
        var acc = b.v
        acc = acc ^ f0
        acc = acc ^ f1
        acc = acc ^ f2
        acc = acc ^ f3
        acc = acc ^ f4
        acc = acc ^ f5
        acc = acc ^ f6
        acc = acc ^ f7
        acc = acc ^ f8
        acc = acc ^ f9
        acc = acc ^ f10
        acc = acc ^ f11
        acc = acc ^ f12
        acc = acc ^ f13
        acc = acc ^ f14
        acc = acc ^ f15
        acc = acc ^ f16
        acc = acc ^ f17
        acc = acc ^ f18
        acc = acc ^ f19
        acc = acc ^ f20
        acc = acc ^ f21
        acc = acc ^ f22
        acc = acc ^ f23
        acc = acc ^ f24
        acc = acc ^ f25
        acc = acc ^ f26
        acc = acc ^ f27
        acc = acc ^ f28
        acc = acc ^ f29
        acc = acc ^ f30
        acc = acc ^ f31
        sink = acc
    }
}

func f(c: Bool): Int64 {
    var r = 0
    if (c) {
        let a = A()
        r = a.b.v
    }
    return r
}

var g_pollute: (Int64) -> Int64 = g

func g(n: Int64): Int64 {
    var s: Int64 = 0
    s = s ^ (n * 31 + 7)
    return s ^ n
}

main(args: Array<String>): Int64 {
    let n = args.size
    let fp = f
    var sum = 0
    for (i in 0..1000) {
        sum += fp(n < 0)
    }
    println("survived: sum=${sum} sink=${sink}")
    if (sum == 0 && sink == 0) {
        return 0
    }
    return 1
}
