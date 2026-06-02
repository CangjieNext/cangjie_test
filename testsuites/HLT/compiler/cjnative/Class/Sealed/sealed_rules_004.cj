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

sealed interface I {}

extend Int64 <: I {}

func f(x: I) {
    match (x) {
        case _: Int32 => "警告 不可达"
        case _: Int64 => "Int64是I类型"
        case _: I => "警告 不可达"
        case _ => "警告 不可达"
    }
}

main(): Int64 {
    if (f(1) == "Int64是I类型") {
        return 0
    }
    return 1
}
