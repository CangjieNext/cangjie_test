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

// 测试@Receiver修饰用法：被指定的函数含有各种类型参数，修饰init等

var array = ArrayList<Int64>()

@Actor[enableReceiverPriority: true]
public class MyActor {
    @Receiver[priority: 10]
    public func foo0(): Unit {
        sleep(2 * Duration.second)
    }

    @Receiver[priority: 1]
    public func foo1(a: Int64): Unit {
        array.add(a)
    }

    @Receiver[priority: 3]
    public func foo3(): Unit {
        array.add(3)
    }

    @Receiver[priority: 2]
    public func foo2(a!: Int64 = 2): Unit {
        array.add(a)
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
    public func foo9(a: Int64, b!: Int64, c!: Int64 = 3): Unit {
        array.add(a + b + c)
    }

    @Receiver[priority: 10]
    public func foo10(): Unit {
        array.add(priority)
    }
}

main() {
    let actor = MyActor()
    actor.foo0()

    actor.foo2()
    actor.foo4()
    actor.foo1(1)
    actor.foo3()
    actor.foo9(100, b: 10)
    actor.foo10()
    actor.foo7()
    actor.foo8()
    actor.foo6()
    actor.foo5()

    sleep(4 * Duration.second)
    if (array.toArray() != [10, 113, 8, 7, 6, 5, 4, 3, 2, 1]) {
        println(array)
        return 1
    }
    return 0
}
