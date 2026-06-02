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
    | Year8(Float32)
    | Month1(Float32, (Float32, Float32))
}

let oneYear = TimeUnit.Year8(1.0)
var a: Float32 = 1.0

extend time {
    static func foo() {
        match (oneYear) {
            case TimeUnit.Year8(_: Float32) | Month1(1.0, (1.0, 1.0)) where (a < 0.0) => a
            case TimeUnit.Year8(_: Float32) | Month1(1.0, (1.0, 1.0)) where (a > 0.0) => a
            case _ => Float32(0.0)
        }
    }
}

type time = TimeUnit

main(): Int64 {
    if (time.foo() == 1.0) {
        return 0
    } else {
        return 1
    }
}
