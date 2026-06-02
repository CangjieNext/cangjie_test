/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type A = classA

open class classA {
    var a = 1
}

class classB <: A {
    var c = 2
}

var a: A = classB()

struct structA {
    public mut prop b: A {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main(): Int64 {
    var x = structA()
    let y = x.b // get
    x.b = classA() // set
    if (y.a == 1) {
        return 0
    } else {
        return 1
    }
}
