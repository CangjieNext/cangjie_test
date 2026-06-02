/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let tuple = (1, 2, 3)
let t1 = Option<(Int64, Int64, Int64)>.Some(tuple)

main() {
    t1?[0] = 10
    return 0
}
// ASSERT: scan sema_unqualified_left_value_assigned
