/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0-core
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1

import stdx.actors.*
import stdx.actors.macros.*

@Actor
class MyActor {
    let x: Int64

    init(x: Int64) {
        this.x = x
    }

    @Receiver
    func foo(): Int64 {
        x
    }

    @Receiver
    func bar(y: Int64): Int64 {
        x + y
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
    func testReceiver1() {
        let a = MyActor(42)
        let fut = a.foo()
        let res = fut.get()
        @Expect(res, 42)
    }

    @TestCase
    func testReceiver2() {
        let a = MyActor(21)
        let fut = a.bar(21)
        let res = fut.get()
        @Expect(res, 42)
    }
}
