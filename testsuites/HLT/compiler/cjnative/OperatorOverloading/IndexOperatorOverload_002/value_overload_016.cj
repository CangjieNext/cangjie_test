/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

var x = 0
var y = 0
var a: Float32 = 0.0
var b: Float64 = 0.0
var c: Rune = r'0'
var d: Bool = false
var e: (Int64, Int32) = (1, 2)
var f: String = "0.0"

func foo(arg2: Float64) {
    b = (arg2 + arg2) * arg2
    return b
}

type ca = A

class B <: ca {
    B(var cb: Int64) {
        this.cb = cb
    }

    func foo(a: Int64) {
        y = a
    }
}

open class A {
    func ff(arg3: Rune) {
        return r'4'
    }

    protected operator func [](arg1: Int64): B {
        return B(arg1)
    }

    protected operator func [](arg1: Int64, value!: A): Unit {
        x = arg1 * 2
    }

    operator func [](arg1: Float32, arg2: Float64, arg3: Rune, arg4: Bool, arg5: (Int64, Int32), arg6: String): A {
        while (arg1 > 0.0) {
            a = arg1 * Float32(2.0)
            break
        }
        b = foo(arg2)
        c = ff(arg3)
        d = if (arg4) {
            arg4
        } else {
            !arg4
        }
        e = {=> arg5}()
        f = (arg6 + arg6)
        return this
    }

    operator func [](arg1: Float32, arg2: Float64, arg3: Rune, arg4: Bool, arg5: (Int64, Int32), arg6: String, value!: B): Unit {
        while (arg1 > 0.0) {
            if (arg4) {
                for (i in 0..Int64(foo(arg2))) {
                    value.cb += arg5[0]
                }
                if (ff(arg3) == r'4' && arg6 == "11") {
                    value.foo(A()[value.cb].cb)
                }
            }
            break
        }
    }
}

main(): Int64 {
    if (A()[2] is A && A()[1.0, 1.0, r'1', false, (3, 4), "1"] is ca) {
        A()[A()[A()[A()[A()[A()[A()[A()[A()[A()[A()[2].cb].cb].cb].cb].cb].cb].cb].cb].cb].cb] = A()[A()[A()[A()[A()[A()[A()[A()[A()[A()[A()[2]
                                                    .cb]
                                                .cb]
                                            .cb]
                                        .cb]
                                    .cb]
                                .cb]
                            .cb]
                        .cb]
                    .cb]
                .cb]
        A()[1.0, 1.0, r'1', true, (x, 4), "11"] = B(2)
        if (A()[1.0, 1.0, r'1', false, (A()[A()[2].cb].cb, 4), "1"] is A && x == 4 && a == 2.0 && b == 2.0 && c == r'4' &&
            d && e[0] == 2 && f == "11" && y == 10) {
            return 0
        }
    }
    return 1
}
