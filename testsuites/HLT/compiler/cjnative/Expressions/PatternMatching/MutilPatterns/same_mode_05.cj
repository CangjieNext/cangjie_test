/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

class A {}

struct B {}

var a: Array<Int64> = [1, 2]

enum C {
    Day
}

let scoreTuple = (A(), B(), a, Day)

extend A {
    func foo() {
        var scoreResult: String = match (scoreTuple) {
            case (_: A, _, _: Array<Int64>, Day) | (_: C, _, _, _) => "three"
            case (_, _, _, _) => ""
        }
        return scoreResult
    }
}

main(): Int64 {
    if (A().foo() == "three") {
        return 0
    } else {
        return 1
    }
}
