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

// var-get
open class A {
    public var a: Int64 = 1
    public mut open prop i: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

class B <: A {
    public mut override prop i: Int64 {
        get() {
            return 2
        }
    }
}

// var-set
open class C {
    public var a: Int64 = 1
    public mut open prop i: Int64 {
        get() {
            return a
        }
        set(v) {
            a = v
        }
    }
}

class D <: C {
    public mut override prop i: Int64 {
        set(v) {
            a = v + 1
        }
    }
}

main(): Int64 {
    var a = A()
    a.i = 1
    if (a.i != 1) {
        return 1
    }
    var b = B()
    b.i = 2
    if (b.i != 2) {
        return 2
    }

    var c = C()
    c.i = 2
    if (c.i != 2) {
        return 3
    }
    var d = D()
    d.i = 2
    if (d.i != 3) {
        return 4
    }

    return 0
}
