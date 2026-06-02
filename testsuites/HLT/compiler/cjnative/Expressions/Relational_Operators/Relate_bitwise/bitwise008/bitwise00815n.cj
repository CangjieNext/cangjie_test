/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 位操作符中使用return
main(): Int64 {
    var a = !10 >> return 0
    var b = !return 10 >> 0
    if (a == "-6") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_invalid_binary_expr
