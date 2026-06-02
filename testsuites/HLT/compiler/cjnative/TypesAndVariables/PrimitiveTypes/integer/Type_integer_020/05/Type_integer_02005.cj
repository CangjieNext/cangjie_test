/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f


main(): Int64 {
    let int32_var_A: Int32 = _-32768
    if (int32_var_A != -32768) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_unexpected_expected_found
