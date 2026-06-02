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
    let temp = [1, 2]
    var temp1 = 1
    var temp2 = 2
    var temp3 = temp1 + temp2
    let b = temp[temp3 - 2 + 1]
}

main() {
    test()
    0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_idx_out_of_bounds
