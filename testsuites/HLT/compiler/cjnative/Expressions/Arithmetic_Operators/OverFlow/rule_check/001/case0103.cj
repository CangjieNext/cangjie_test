/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

let a: (Int8, Int8) = (10, 10)
let b: Int8 = 120 + a[0]

main() {
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
