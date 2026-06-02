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

extend String <: TI {
    public operator func /(a: String): String {
        "56"
    }
}

interface I {
    // operator func /(a:String){"56"}
}

var a: String = "first"

enum A {
    B

    public prop b: String {
        get() {
            a + a / a
        }
    }
}

main(): Int64 {
    let y = A.B.b + "get" // get
    if (y == "first56get") {
        return 0
    } else {
        return 1
    }
}
