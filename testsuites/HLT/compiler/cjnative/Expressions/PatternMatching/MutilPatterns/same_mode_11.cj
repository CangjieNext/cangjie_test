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
    | Year5(TimeUnit2)
    | Month(A, TimeUnit2)
}

enum TimeUnit2 {
    MyTime2
}

class A {}

let oneYear = TimeUnit.Month(A(), MyTime2)
var result: Float32 = 0.0
let ee: Future<Float32> = spawn {
    result = match (oneYear) {
        case Year5(MyTime2) | Month(_: A, MyTime2) | Month(_: TimeUnit2, _: A) => 1.0
        case _ => 0.0
    }
    result
}
let res: Float32 = ee.get()

main(): Int64 {
    if (result == 1.0) {
        return 0
    } else {
        return 1
    }
}
