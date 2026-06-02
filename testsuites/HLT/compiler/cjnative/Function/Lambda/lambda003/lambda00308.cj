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
func test(): Int64 {
    let sum: (Float64, Float64) -> Float64 = {a, b => a + b}
    return Int64(sum(0.5, -0.5))
}

main(): Int64 {
    return test()
}
