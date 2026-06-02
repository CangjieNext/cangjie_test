/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.deriving.*

@Derive[ToString]
struct S1 {
    var a = 1
    S1(c: String, _: Int, let b: Int, var d!: String = "aaa") {
        let _ = c // suppress unused warning
    }
}

main() {
    let s = S1("xxx", 999, 2).toString()
    if (s != "S1(a: 1, b: 2, d: aaa)") {
        println("S1.toString() = ${s}")
        return 1
    }
    return 0
}
