/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_args 

import stdx.actors.*
import stdx.actors.macros.*

@Actor
public class MyActor {
    static func goo() {
        "123"
    }

    @Receiver
    public func foo1(): String {
        MyActor.goo()
    }

    @Receiver
    public func foo2(str!: String = MyActor.goo()): String {
        str
    }
}

main() {
    let myActor = MyActor()
    myActor.foo1().get()
    myActor.foo1().get()
    0
}
