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

let scoreTuple = ("Allen", 90)

class A {
    static func foo() {
        match (scoreTuple) {
            case ("Allen", 90) | (_, 80) where (scoreTuple[1] < 0) => "fail"
            case ("Allen", 90) | (_, 80) where (scoreTuple[1] > 0) => "Allen got 90"
            case (_, _) => "end"
        }
    }
}

main(): Int64 {
    if (A.foo() == "Allen got 90") {
        return 0
    } else {
        return 1
    }
}
