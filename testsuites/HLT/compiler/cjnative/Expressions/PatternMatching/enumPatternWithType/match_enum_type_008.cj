/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
enum A {
    EA | EB(Float64)
}

enum TimeUnit {
    Month
    | Year(A)
}

main() {
    var a1 = Year(EA)
    var b1 = match (a1) {
        case TimeUnit.Month => 3
        case Year(EA) => 4
        case TimeUnit.Year(A.EB(c)) => Int64(c)
    }

    var a2 = Year(EB(2.0))
    var b2 = match (a2) {
        case TimeUnit.Month => 3
        case Year(EA) => 4
        case TimeUnit.Year(A.EB(c)) => Int64(c)
    }
    return b1 + b2 - 6
}
