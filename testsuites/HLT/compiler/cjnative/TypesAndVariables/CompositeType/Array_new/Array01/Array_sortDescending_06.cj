/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sort.*

var a1 = [[r'b', r'f', r'a'], [r'd', r'a', r'c']]

main(): Int64 {
    a1.sortDescending()
    a1.sortDescending(stable: true)
    a1[0].sortDescending()
    a1[1].sortDescending()
    return 0
}
// ASSERT: scan sema_not_member_of
