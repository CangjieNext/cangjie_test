/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func numericForms(): Float64 {
    let bin = 0b1010_1110
    let oct = 0o755
    let hex = 0xFF_FF
    let dec = 1_000_000
    let f1 = 0.5
    let f2 = 1.5e-3
    let f3 = 1_000.000_1
    let neg = -1.5e-3
    let sum = bin + oct + hex + dec
    return Float64(sum) + f1 + f2 + f3 + neg
}

main() {
    println(numericForms())
}
