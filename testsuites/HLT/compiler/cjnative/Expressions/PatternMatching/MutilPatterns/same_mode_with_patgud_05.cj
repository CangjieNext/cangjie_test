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

var a: Array<Int64> = [1, 2]
let scoreTuple = (A(), B(), a)

struct B {
    func foo() {
        match (scoreTuple) {
            case (_: A, _: B, _) | (_: Array<Int64>, _, _) where (scoreTuple[2][1] == 1) => "fail"
            case (_: A, _: B, _) | (_: Array<Int64>, _, _) where (scoreTuple[2][1] == 2) => "three"
            case (_, _, _) => "end"
        }
    }
}

main(): Int64 {
    if (B().foo() == "three") {
        return 0
    } else {
        return 1
    }
}
