/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64{
    var a = 2
    var b = 2  
     **= 2
    return 0
}
// ASSERT: scan parse_cannot_have_assi_in_init
// ASSERT: scan parse_nl_warning
// ASSERT: scan parse_invalid_left_hand_expr
