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

class A {
    var x: Int64 = 0
    var y: Int64 = 0
    init(a: Int64, b: Int64) {
        x = a
        y = b
    }
}

struct B {
    var x: Int64 = 0
    var y: Int64 = 0
    init(a: Int64, b: Int64) {
        x = a
        y = b
    }
}

enum C {
    | x | y
}

func f1() {
    0
}

func f2() {
    1
}

var a: Unit = ()
var b: Int64 = 0
var c: Int64 = 0
var d: Int64 = 0
var e: Int64 = 0
var f: Float64 = Float64(f1())
var g: Array<Int64> = [1, 2]

interface I {
    operator func [](arg1: Unit, arg2: C, arg3: A, arg4: B, arg5: Range<Int64>, arg6: () -> Int64, arg7: Array<Int64>): I
}

class D <: I {
    public operator func [](arg1: Unit, arg2: C, arg3: A, arg4: B, arg5: Range<Int64>, arg6: () -> Int64,
        arg7: Array<Int64>): D {
        a = arg1
        b = match (y) {
            case x => 0
            case y => 1
            case _ => 10
        }
        c = arg3.y
        c++
        d = arg4.y
        d--
        var ee: Future<Int64> = spawn {
            for (i in arg5) {
                e += i
            }
            e
        }
        let res: Int64 = ee.get()
        f = Float64(arg6())
        try {
            var h = arg7[7]
        } catch (_) {
            g = arg7
        }
        return this
    }
}

main(): Int64 {
    if (D()[(), C.y, A(2, 3), B(3, 4), 2..4, f2, [3, 4]] is I && a == () && b == 1 && c == 4 && d == 3 && e == 5 && f ==
        1.0 && g[1] == 4) {
        return 0
    } else {
        return 1
    }
}
