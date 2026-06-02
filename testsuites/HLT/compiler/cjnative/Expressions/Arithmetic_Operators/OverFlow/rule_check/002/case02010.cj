/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../002
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test() {
    let a = [1, 2, 3]
    var temp = 1
    if (true) {
        temp = 3
    } else {
        temp = 3
    }
    let b = a[temp]
}

main() {
    test()
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_idx_out_of_bounds
