/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func cond() {
    var temp = true
    return temp
}

func test() {
    var temp1 = 1
    if (cond()) {
        temp1 = 1
    } else {
        temp1 = 1
    }
    var a = temp1 / (temp1 - 1)
}

main() {
    test()
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_divisor_is_zero
