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
    var i1: Int64 = -9223372036854775808
    var i: Int32 = Int32(i1 - 1)

    return 1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_arithmetic_operator_overflow
