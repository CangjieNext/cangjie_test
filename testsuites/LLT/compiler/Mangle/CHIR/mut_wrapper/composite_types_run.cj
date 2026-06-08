// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: generated mut wrappers for generic default methods must preserve
// type substitutions across struct/class implementors, member/top-level
// functions, and composite generic arguments.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

func bump(value: Int64): Int64 {
    value + 1
}

interface I {
    mut func id<T>(value: T): T {
        let local: T = value
        local
    }

    mut func apply<T>(value: T, op: (T) -> T): T {
        let local: T = op(value)
        local
    }

    mut func triple<T, U, V>(a: T, b: U, c: V): (T, U, V) {
        let first: T = a
        let second: U = b
        let third: V = c
        (first, second, third)
    }
}

struct S <: I {
    public func member(value: Int64): Int64 {
        value + 2
    }
}

class C <: I {
    public func member(value: Int64): Int64 {
        value + 3
    }
}

main(): Int64 {
    var s = S()
    var c = C()
    let (a, b, d) = s.triple<Int64, String, Bool>(7, "tuple", true)
    let arr = s.id<Array<Int64>>([1, 2, 3])
    let top = s.apply<Int64>(10, bump)
    let memberFromStruct = s.apply<Int64>(10, s.member)
    let memberFromClass = c.apply<Int64>(10, c.member)
    let fn = c.id<(Int64) -> Int64>(bump)
    if (a == 7 && b == "tuple" && d && arr[1] == 2 &&
        top == 11 && memberFromStruct == 12 && memberFromClass == 13 &&
        fn(20) == 21) {
        println("composite: ok")
    }
    return 0
}

/* SCAN
composite: ok
*/
