/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan-6 Macro options: priority must be an integer literal inside the range [1..10].

import stdx.actors.*
import stdx.actors.macros.*

open class Father {}

@Actor[enableReceiverPriority: true]
class MyActor <: Father {
    @Receiver[priority: 0]
    public func foo(actionpriority: Int64): Int64 {
        10
    }

    @Receiver[priority: 11]
    public func foo(actionpriority: UInt64): Int64 {
        10
    }

    @Receiver[priority: 8.2]
    public func foo(actionpriority: UInt32): Int64 {
        10
    }

    @Receiver[priority: -1]
    public func goo(actionpriority: UInt32): Int64 {
        10
    }

    @Receiver[priority: 1i8]
    public func goo(): Int64 {
        10
    }

    @Receiver[priority: true]
    public func hoo(): Int64 {
        10
    }
}

main() {
    MyActor().foo(1).get()
    0
}
