/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.SyncCounter

class A {
    var a = 1
}

main(): Int64 {
    let a = A()
    let thread = Thread()
    return 0
}
// ASSERT: scan sema_no_match_constructor
