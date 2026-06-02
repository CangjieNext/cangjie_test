/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A<T> = structA<T, Bool>

type TI = I

var c = true

struct structA<T, K> {
    public var a: T
    public var b: K
    public structA(var x: T, var y: K) {
        this.a = x
        this.b = y
    }
}

interface I {
    mut prop e: Bool {
        get() {
            c
        }
        set(v) {
            c = v
        }
    }
}

extend<T, K> structA<T, K> <: TI {}

struct B {
    public func a(a: A<String>) {
        if (a.a == a.b.toString()) {
            return true
        } else {
            return false
        }
    }
}

main(): Int64 {
    var f = A<String>("true", true)
    if (B().a(A<String>("true", A<String>("true", true).e))) {
        f.e = false
        if (!A<String>("true", true).e) {
            return 0
        } else {
            return 0
        }
    } else {
        return 1
    }
}
