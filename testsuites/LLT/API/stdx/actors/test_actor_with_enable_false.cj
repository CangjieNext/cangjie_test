/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

import stdx.actors.*
import stdx.actors.macros.*
import std.collection.*

@Actor[enableReceiverPriority: false]
class MyActor {
    let x: Int64
    let array = ArrayList<Int64>()

    init(x: Int64) { this.x = x }

    @Receiver
    func foo(): Int64 {
        x
    }

    @Receiver
    func bar(y: Int64): Int64 {
        x + y
    }

    @Receiver
    public func foo0(): Unit {
        sleep(3 * Duration.second)
    }

    @Receiver
    public func foo1(): Unit {
        array.add(1)
    }

    @Receiver
    public func foo3(): Unit {
        array.add(3)
    }

    @Receiver
    public func foo2(): Unit {
        array.add(2)
    }

    @Receiver
    public func foo4(): Unit {
        array.add(4)
    }
}

@Test
public class ActorTest {
    @TestCase
    func testInit() {
        let a = MyActor(42)
        @Expect(a.x, 42)
    }

    @TestCase
    func testPostingFromSameThread() {
        let actor = MyActor(21)
        actor.foo0()
        actor.foo2()
        actor.foo4()
        actor.foo1()
        actor.foo3()
        sleep(5 * Duration.second)
        @Expect(actor.array[0], 2)
        @Expect(actor.array[1], 4)
        @Expect(actor.array[2], 1)
        @Expect(actor.array[3], 3)
    }
}