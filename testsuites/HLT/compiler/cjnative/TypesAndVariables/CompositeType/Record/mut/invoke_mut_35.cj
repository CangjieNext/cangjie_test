/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    mut func f(): Unit
}

struct Foo <: I {
    public var v = 0
    public mut func f(): Unit {
        v += 1
    }

    public mut func f(a: Int64): Unit {
        v += a
    }

    public mut func f(a: Int64, b: Int64): Unit {
        v = v + a + b
    }
}

main() {
    var a = Foo()
    if (a.f() == ()) {
        while (a.v < 5) {
            a.f()
        }
    }

    return a.v - 5
}
