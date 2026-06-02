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
    var b : Array<Int32> = {=>2}
    var r : Int32 = 2
    for (i in b) {}  = r 
    do {} while ((false) = r)   
    while (false) {} = r 
    return 0
}
// ASSERT: scan parse_invalid_left_hand_expr
