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

type t1 = Int64

type TI = I

var d = 0

extend t1 <: TI {
    public prop i: Int64 {
        get() {
            d
        }
    }
}

interface I {
    prop i: Int64 {
        get() {
            d
        }
    }
}

func a(a: t1) {
    var i: t1 = 1
    var sum: t1 = 0
    while (i <= 100) {
        if (Int64(1).i is t1) {
            sum += i
        } else {
            sum = a
        }
        i++
    }
    return sum
}

main(): Int64 {
    if (a(1) == 5050) {
        return 0
    } else {
        return 1
    }
}
