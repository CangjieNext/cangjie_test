/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// ASSERT: scan priority option can only be used inside @Actor[enableReceiverPriority: true].

import std.collection.*
import stdx.actors.*
import stdx.actors.macros.*

// enableReceiverPriority: false 不生效

var array = ArrayList<Int64>()

@Actor[enableReceiverPriority: false]
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

    actor.foo2()
    actor.foo4()
    actor.foo1()
    actor.foo3()
    actor.foo9()
    actor.foo10()
    actor.foo7()
    actor.foo8()
    actor.foo6()
    actor.foo5()

    sleep(4 * Duration.second)
    if (array.toArray() != [2, 4, 1, 3, 9, 10, 7, 8, 6, 5]) {
        println(array)
        return 1
    }
    return 0
}
