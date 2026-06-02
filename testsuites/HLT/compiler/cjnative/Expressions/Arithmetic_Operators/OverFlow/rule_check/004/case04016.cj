/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../004
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test() {
    var a: Int8 = 10
    var b: Int8 = 10
    var c: Int8 = b + 2
    var d: Int8 = c / 2
    var e: Int8 = d * 2
    var f: Int8 = e + d
    var g: Int8 = f - 2

    let res: Int8 = a >> g
}

main() {
    test()
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_shift_length_overflow
