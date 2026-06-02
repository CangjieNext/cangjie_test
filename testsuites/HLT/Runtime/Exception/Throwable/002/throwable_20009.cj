/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var a = [1, 2, 3]
    var res = 3
    try {
        a[res - 10]
    } catch (e: Exception) {
        e.printStackTrace()
        return res
    } finally {
        res = 0
        return res
    }
    res = 4
    return res
}
// ASSERT: scan chir_idx_out_of_bounds
