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
    var uint8_Low_Median_One: uint_8 = 128

    if (uint8_Low_Median_One == 128) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: scan sema_undeclared_type_name
