/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a1: Range<Int32> = (0..2 : 1)
    a1.start = 1
    a1.end = 2
    a1.step = 2
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
