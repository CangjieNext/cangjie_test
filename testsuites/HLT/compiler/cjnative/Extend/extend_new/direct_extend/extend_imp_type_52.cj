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

type str = String

extend str {
    public operator func /(a: str) {
        "56"
    }
}

var a: str = "first"

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
