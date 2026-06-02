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

type int = Int16

var a: int = 0

interface interfaceA {}

class classA {}

extend classA <: interfaceA {
    public mut prop b: int {
        get() {
            a
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
    if (x.b == 1) {
        return 0
    } else {
        return 1
    }
}
