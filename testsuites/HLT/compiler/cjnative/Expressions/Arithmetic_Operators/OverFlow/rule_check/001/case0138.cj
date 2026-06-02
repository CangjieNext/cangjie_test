/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func a() {
    let a: Int8 = 127
    let b = a
    let c = b
    let d = c
    let e = d - 10

    let f = e
    let g = f * 1
    let h = g + 10
    let i = h
    let z = i + 10
}

main() {
    a()
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_arithmetic_operator_overflow
