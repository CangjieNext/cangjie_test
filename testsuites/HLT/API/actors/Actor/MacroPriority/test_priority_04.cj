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

import std.collection.*
import stdx.actors.*
import stdx.actors.macros.*

// 默认优先级5

var array = ArrayList<Int64>()

@Actor[enableReceiverPriority: true]
public class MyActor {
    @Receiver[priority: 10]
    public func foo0(): Unit {
        sleep(2 * Duration.second)
    }

    @Receiver
    public func foo__5(): Unit {
        array.add(500)
    }

    @Receiver[priority: 1]
    public func foo1(): Unit {
        array.add(1)
    }

    @Receiver[priority: 4]
    public func foo4(): Unit {
        array.add(4)
    }

    @Receiver[priority: 5]
    public func foo5(): Unit {
        array.add(5)
    }

    @Receiver
    public func foo_5(): Unit {
        array.add(50)
    }

    @Receiver[priority: 6]
    public func foo6(): Unit {
        array.add(6)
    }

    @Receiver[priority: 10]
    public func foo10(): Unit {
        array.add(10)
    }
}

main() {
    let actor = MyActor()
    actor.foo0()

    actor.foo4()
    actor.foo_5()
    actor.foo1()
    actor.foo10()
    actor.foo5()
    actor.foo6()
    actor.foo__5()

    sleep(4 * Duration.second)
    if (array.toArray() != [10, 6, 50, 5, 500, 4, 1]) {
        println(array)
        return 1
    }
    return 0
}
