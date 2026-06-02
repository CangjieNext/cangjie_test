/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type Int = Int32

type Int = Int64

main(): Int64 {
    var i1: Int64 = 1
    var i2: Int = 2
    var res: Int = i1 + i2
    if (res == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_redefinition
// ASSERT: scan sema_ambiguous_use
