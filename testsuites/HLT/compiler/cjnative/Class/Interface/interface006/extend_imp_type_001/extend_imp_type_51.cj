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

type int = Int32

var d = 0
var a: (Int64, Int64) = (1, 1)

interface I {
    prop b: Int64 {
        get() {
            d
        }
    }
}

extend int <: I {}

interface interfaceA {
    mut prop b: (Int64, Int64) {
        get() {
            (Int32(2).b, Int32(2).b)
        }
        set(v) {
            a = v
        }
    }
}

class classA <: interfaceA {}

main(): Int64 {
    var x = classA()
    let y = x.b[0] + 1 // get
    x.b = (2, 2)
    let z = x.b[0] + 1
    if (y == z) {
        return 0
    } else {
        return 1
    }
}
