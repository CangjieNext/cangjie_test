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

enum D {
    d(Int64) | d
}

enum E {
    e(D) | e
}

main(): Int64 {
    var a: E = e(d(1))
    match (a) {
        case e(d) => 1
        case e(d(v)) => v - 1
        case e => 2
    }
}
