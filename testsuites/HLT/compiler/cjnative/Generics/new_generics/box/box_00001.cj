/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {}

extend Int64 <: I {}

func test(x: I): I {
    x
}

main() {
    var x: I = test(1)
    var v1 = x is Int64
    var v2 = x as Int64
    var v3 = match (x) {
        case v: Int64 => true
        case _ => false
    }
    if (v1 && v2 is Option<Int64> && v3) {
        return 0
    }
    return 1
}
