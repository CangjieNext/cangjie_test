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
    var a1: Int8 = -128 << 1
    var a2: Int8 = -256 >> 1
    var a3: Int8 = 258 >> 1
    var a4: Int8 = 65 << 1
    return 0
}
// ASSERT: scan sema_mismatched_types
