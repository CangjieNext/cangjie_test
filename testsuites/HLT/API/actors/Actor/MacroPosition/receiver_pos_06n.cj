/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan @Receiver macro: the name priority cannot be used as a named parameter.

import stdx.actors.*
import stdx.actors.macros.*

open class Father {}

@Actor[enableReceiverPriority: true]
class MyActor <: Father {
    @Receiver
    public func foo(priority!: Int64 = 1): Int64 {
        10
    }
}

main() {
    MyActor().foo()
    0
}
