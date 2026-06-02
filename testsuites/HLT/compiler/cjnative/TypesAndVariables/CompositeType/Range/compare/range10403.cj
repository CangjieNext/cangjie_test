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
    var a: Range<Float64> = 0.5..5.5 : 2
    var b: Range<Float64> = 0.5..=5.5 : 2
    if (a == b) {
        return 0
    }
    return 2
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
