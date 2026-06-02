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
var aa: Int16 = 0
var bb: UInt16 = 0
var cc: Int8 = 0
var dd: UInt8 = 0
var ee: Float16 = 0.0
var op1: Int64 = 0
var op2: A = B()

open class A {}

class B <: A {}

func foo(arg2: Float64) {
    b = (arg2 + arg2) * arg2
    return b
}

extend A {
    private operator func [](arg1: Float32, arg2: Float64, arg3: Rune, arg4: Bool, arg5: (Int64, Int32), arg6: String,
        value!: Int64): Unit {
        while (arg1 > 0.0) {
            a = arg1 * 2.0
            op1 = Int64(a) + value
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
    }

    private operator func [](arg1: Int16, arg2: UInt16, arg3: Int8, arg4: UInt8, arg5: Float16, value!: A): Unit {
        while (arg1 >= 0) {
            aa = (arg1 + 1) * 2
            op2 = value
            break
        }
        bb = match (arg2) {
            case 2 => arg2 * 2
            case _ => arg2
        }
        cc = if (arg3 > 0) {
            arg3 + arg3
        } else {
            arg3 * arg3
        }
        dd = (arg4)
        ee = {=> arg5}()
        return
    }

    func ff(arg3: Rune) {
        return r'4'
    }

    func foo() {
        A()[1.0, 1.0, r'1', false, (3, 4), "1"] = 1
        A()[1, 2, 3, 4, 5.0] = A()
    }
}

main(): Int64 {
    A().foo()
    if (a == 2.0 && b == 2.0 && c == r'4' && d && e[0] == 3 && f == "11" && aa == 4 && bb == 4 && cc == 6 && dd == 4 &&
        ee == 5.0 && op1 == 3 && !(op2 is B)) {
        return 0
    } else {
        return 1
    }
}
