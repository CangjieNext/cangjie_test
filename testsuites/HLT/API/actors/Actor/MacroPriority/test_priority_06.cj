/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_args 

import std.collection.*
import stdx.actors.*
import stdx.actors.macros.*

// priority1-10；高优先级先操作; 可以通过在调用时指定优先级，以指定时为准

var array = ArrayList<Int64>()

@Actor[enableReceiverPriority: true]
public class MyActor {
    @Receiver[priority: 10]
    public func foo0(): Unit {
        sleep(2 * Duration.second)
    }

    @Receiver[priority: 1]
    public func foo1(): Unit {
        array.add(1)
    }

    @Receiver[priority: 3]
    public func foo3(): Unit {
        array.add(3)
    }

    @Receiver[priority: 2]
    public func foo2(): Unit {
        array.add(2)
    }

    @Receiver[priority: 4]
    public func foo4(): Unit {
        array.add(4)
    }

    @Receiver[priority: 5]
    public func foo5(): Unit {
        array.add(5)
    }

    @Receiver[priority: 6]
    public func foo6(): Unit {
        array.add(6)
    }

    @Receiver[priority: 7]
    public func foo7(): Unit {
        array.add(7)
    }

    @Receiver[priority: 8]
    public func foo8(): Unit {
        array.add(8)
    }

    @Receiver[priority: 9]
    public func foo9(): Unit {
        array.add(9)
    }

    @Receiver[priority: 10]
    public func foo10(): Unit {
        array.add(10)
    }
}

main() {
    let actor = MyActor()
    actor.foo0()

    actor.foo2(priority: 9)
    actor.foo4(priority: 7)
    actor.foo1(priority: 10)
    actor.foo3(priority: 8)
    actor.foo9(priority: 2)
    actor.foo10(priority: 1)
    actor.foo7(priority: 4)
    actor.foo8(priority: 3)
    actor.foo6(priority: 5)
    actor.foo5(priority: 6)

    sleep(4 * Duration.second)
    if (array.toArray() != [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
        println(array)
        return 1
    }
    return 0
}
