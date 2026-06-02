/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test() {
    let temp = (2, 10)
    let a: Int8 = 10 >> temp[1]
}

main() {
    test()
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_shift_length_overflow
