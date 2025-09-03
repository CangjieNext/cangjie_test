/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan @Receiver macro: receiver method 'foo' cannot be static nor open nor overriding another function.
// ASSERT: scan @Receiver macro: receiver method 'goo' cannot be static nor open nor overriding another function.
// ASSERT: scan @Receiver macro: receiver method 'soo' cannot be static nor open nor overriding another function.

import stdx.actors.*
import stdx.actors.macros.*

open class Father<T> {
    func soo(): Int64 {
        1
    }
}

@Actor
class MyActor<T> <: Father<T> {
    @Receiver
    static func foo<T>(): Int64 {
        10
    }

    @Receiver
    open func goo(): Int64 {
        10
    }

    @Receiver
    override func soo(): Int64 {
        10
    }
}

main() {
    0
}
