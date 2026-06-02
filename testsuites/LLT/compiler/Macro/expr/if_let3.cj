// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler --error-count-limit=10000 --diagnostic-format=json %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

@M
main() {
    let x3 = Option<Int32>.None
    let x4 = (1, 2, "hello")
    if (let (1, 3, "hello") <- x4) {
        println("TuplePat Works")
        return 1
    } else if (let (1, 2, "hello") <- x4) {
        println("Nested Matched 1#1")
    } else if (let _ <- x3) {
        println("Nested Matched 1#2")
        return 2
    } else {
        println("final else")
        return 3
    }

    if (let (2, 2, "hello") <- x4) {
        println("Matched 2#1")
        return 4
    } else if (let Some(v) <- x3) {
        return 5
    } else if (let _ <- x3) {
        println("Nested Matched 2#2")
    } else {
        println("final else")
        return 6
    }

    return 0
}
