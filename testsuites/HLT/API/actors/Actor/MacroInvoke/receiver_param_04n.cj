/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan Macro options: duplicated option 'priority'.

import stdx.actors.*
import stdx.actors.macros.*

open class Father {}

@Actor[enableReceiverPriority: true]
class MyActor <: Father {
    @Receiver[priority: 10, priority: 10]
    public func foo(actionpriority: Int64): Int64 {
        10
    }

    @Receiver[priority: 1]
    public func foo(actionpriority: UInt64): Int64 {
        10
    }
}

main() {
    MyActor().foo(1).get()
    0
}
