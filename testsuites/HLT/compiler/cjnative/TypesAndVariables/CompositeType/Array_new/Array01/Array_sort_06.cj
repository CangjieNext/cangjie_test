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

main(): Int64 {
    var a1 = [[r'c', r'd'], [r'a', r'b']]
    a1.sort()
    a1.sort(stable: true)
    a1[0].sort()
    a1[1].sort()
    return 0
}
// ASSERT: scan sema_not_member_of
