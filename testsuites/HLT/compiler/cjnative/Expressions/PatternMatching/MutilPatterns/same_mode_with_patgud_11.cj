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

enum TimeUnit {
    | Year9(TimeUnit2)
    | Month2(A, A)
}

class A {}

let oneYear = TimeUnit.Month2(A(), A())
var a: Int64 = 10

enum TimeUnit2 {
    | Time2
}

main(): Int64 {
    var result = match (oneYear) {
        case Year9(Time2) | Month2(_: A, _: TimeUnit2) | Month2(_: A, _: A) where (a < 1) => 10.0
        case Year9(Time2) | Month2(_: A, _: TimeUnit2) | Month2(_: A, _: A) where (a > 1) => 1.0
        case _ => 0.0
    }
    if (result == 1.0) {
        return 0
    } else {
        return 1
    }
}
