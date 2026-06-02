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

type TI = I

interface I {
    static func a(): Int16 {
        1
    }
}

extend Int16 <: TI {}

var a: Int16 = 0

interface interfaceA {}

class classA {}

type TIA = interfaceA

extend classA <: TIA {
    public mut prop b: Int16 {
        get() {
            Int16.a()
        }
        set(v) {
            a = v
        }
    }
}

main(): Int64 {
    var x = classA()
    let y = x.b + 1 // get
    x.b = y // set
    if (x.b == 1 && y == 2) {
        return 0
    } else {
        return 1
    }
}
