/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let temp: Int64 = 2
    let temp2 = temp - 2
    let a = 2 / temp2
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_divisor_is_zero
