/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var tp1 = (1, 'a')
    var tp2 = (3, 4, 5)
    var tp3 = tp1 == tp2
    return 0
}
// ASSERT: scan sema_invalid_binary_expr
