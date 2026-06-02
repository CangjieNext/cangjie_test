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

type tu = (Int64, Bool)

var a: tu = (1, true)

interface interfaceA {
    mut prop b: tu {
        get() {
            a
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
    let z = !x.b[1] // get

    if (y == 2 && !z && x.b[1]) {
        return 0
    } else {
        return 1
    }
}
