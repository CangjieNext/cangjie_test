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

var a: Float32 = 0.0
var b: Float64 = 0.0
var c: Rune = r'0'
var d: Bool = false
var e: (Int64, Int32) = (1, 2)
var f: String = "0.0"
var aa: Unit = ()

abstract class A {
    public operator func [](arg1: Float32, arg2: Float64, arg3: Rune, arg4: Bool, arg5: (Int64, Int32), arg6: String,
        value!: Unit): Unit
}

func foo(arg2: Float64) {
    b = (arg2 + arg2) * arg2
    return b
}

class B <: A {
    public operator func [](arg1: Float32, arg2: Float64, arg3: Rune, arg4: Bool, arg5: (Int64, Int32), arg6: String,
        value!: Unit): Unit {
        while (arg1 > 0.0) {
            a = arg1 * 2.0
            aa = value
            break
        }
        b = foo(arg2)
        c = arg3
        d = if (arg4) {
            arg4
        } else {
            !arg4
        }
        e = {=> arg5}()
        f = (arg6 + arg6)
    }
}

main(): Int64 {
    B()[1.0, 1.0, r'1', false, (3, 4), "1"] = ()
    if (a == 2.0 && b == 2.0 && c == r'1' && d && e[0] == 3 && f == "11" && aa == ()) {
        return 0
    } else {
        return 1
    }
}
