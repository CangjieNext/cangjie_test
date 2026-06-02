/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.SyncCounter

main(): Int64 {
    let ct = Thread.currentThread
    spawn {
        println(Thread.currentThread.id)
        println(ct.id)
        ct.id = Thread.currentThread.id
    }.get()

    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
