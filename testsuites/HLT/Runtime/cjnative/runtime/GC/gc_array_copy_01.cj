/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan test ok

import std.runtime.*

class A {
    public var a: Int64
    init(a: Int64) {
        this.a = a
    }
}

main() {
    var a: Array<A> = Array<A>(100) {i => A(Int64(i))}
    var counter: Int64 = 0
    spawn {
        while (true) {
            GC()
        }
    }
    for (i in 0..10000) {
        var b = a.clone()
        var c: Array<A> = Array<A>(100) {j => A(Int64(i + j))}
        var k = i % 50
        if (b[k].a == c[k].a) {
            counter++
        } else {
            c.copyTo(a, k, k, 3)
            if (a[k].a != c[k].a) {
                throw Exception("copy to failed")
            }
        }
    }
    println("test ok")
}
