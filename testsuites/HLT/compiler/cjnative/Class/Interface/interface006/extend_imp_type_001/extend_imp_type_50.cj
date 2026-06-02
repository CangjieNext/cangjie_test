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

type A = classA

open class classA {
    var a = 1
}

class classB <: A {
    var c = 2
}

var d: Int64 = 4
var f: Int64 = 0

interface I {
    mut static prop b: Int64 {
        get() {
            d
        }
        set(v) {
            d = v
        }
    }
}

extend A <: I {}

struct structA {
    public mut prop b: Int64 {
        get() {
            A.b
        }
        set(v) {
            f = v
        }
    }
}

main(): Int64 {
    var x = structA()
    x.b = 3
    var z = x.b
    classB.b = 5
    if (z == 4 && x.b == 5) {
        return 0
    } else {
        return 1
    }
}
