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
    let a = [1, 2]
    var temp1 = 0
    let temp2 = temp1
    var temp3 = temp2 + 10
    var temp4 = temp3 - 10
    var temp5 = temp4 * 3
    var temp6 = temp5 / 3
    var temp7 = temp1 + temp2 + temp3 + temp4
    let b = a[temp7 + 2]
}

main() {
    test()
    0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_idx_out_of_bounds
