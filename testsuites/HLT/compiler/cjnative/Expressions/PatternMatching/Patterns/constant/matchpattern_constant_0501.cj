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
    var a: String = "abc\n"
    var result: Int64 = match (a) {
        case "abc" => 2
        case "${a}" => 0
        case _ => 1
    }
    return result
}
// ASSERT: scan sema_interpolation_in_const_pattern
