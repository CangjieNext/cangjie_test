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
    let a = Array<Int64>(3) {i => i * 2}
    var b = a[-1]
}

main() {
    test()
    1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_idx_out_of_bounds
