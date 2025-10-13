/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan @Receiver macro: receiver method 'foo' must have explicit return type.

import stdx.actors.*
import stdx.actors.macros.*

open class Father<T> {}

@Actor
class MyActor<T> <: Father<T> {
    @Receiver
    func foo<T>() {
        10
    }
}

main() {
    MyActor<String>().foo<Int64>()
    0
}
