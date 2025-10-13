/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1
import stdx.actors.*
import std.collection.*
import std.time.*

class MyException <: Exception {}

@Test
public class PriorityActorClassTest {
    @TestCase
    func testPostGetNormal() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Int64>({
            => return 42
        }, priority: 5)
        let res = fut.get()
        @Expect(res, 42)
    }

    @TestCase
    func testPostGetException() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Unit>({
            => throw MyException()
        }, priority: 5)
        @AssertThrows[MyException](fut.get())
    }

    @TestCase
    func testPostGetTimeoutNone() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        a.post<Int64>(
            {
                =>
                    while (true) {
                        sleep(Duration.second)
                    }
                    return 41
            },
            priority: 5
        )
        let fut = a.post<Int64>({
            => return 42
        }, priority: 5)
        let res = fut.get(Duration.second)
        @Expect(res, Option<Int64>.None)
    }

    @TestCase
    func testPostGetTimeoutSome() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Int64>(
            {
                =>
                    sleep(Duration.second)
                    return 42
            },
            priority: 5
        )
        let res = fut.get(Duration.second * 2)
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostGetTimeoutException() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Unit>({
            => throw MyException()
        }, priority: 5)
        @AssertThrows[MyException](fut.get(Duration.second * 2))
    }

    @TestCase
    func testPostTryGetNone() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        a.post<Int64>(
            {
                =>
                    while (true) {
                        sleep(Duration.second)
                    }
                    return 41
            },
            priority: 5
        )
        let fut = a.post<Int64>({
            => return 42
        }, priority: 5)
        let res = fut.tryGet()
        @Expect(res, Option<Int64>.None)
    }

    @TestCase
    func testPostTryGetSome() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Int64>({
            => return 42
        }, priority: 5)
        fut.get()
        let res = fut.tryGet()
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostTryGetException() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Unit>({
            => throw MyException()
        }, priority: 5)
        @AssertThrows[MyException](fut.get())
        @AssertThrows[MyException](fut.tryGet())
    }

    @TestCase
    func testPostError() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let fut = a.post<Int64>(
            {
                =>
                    func test(): Int64 {
                        test() + 1
                    }
                    test()
            },
            priority: 5
        )
        @AssertThrows[StackOverflowError](fut.get())
        @AssertThrows[StackOverflowError](fut.get(Duration.Zero))
        @AssertThrows[StackOverflowError](fut.tryGet())
    }

    @TestCase
    func testPostGetIllegalArgumentException() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        try {
            let fut1 = a.post<Unit>({=> 42}, priority: 0)
            fut1.get()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Priority must be in the range [1..10].")
        }
        try {
            let fut2 = a.post<Unit>({=> 43}, priority: 11)
            fut2.get()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Priority must be in the range [1..10].")
        }
    }

    @TestCase
    func testPostingOrderFromSameThread() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let xs = ArrayList<Int64>()
        a.post<Unit>({=> xs.add(42)}, priority: 5)
        let fut = a.post<Unit>({=> xs.add(43)}, priority: 5)
        fut.get()
        @Expect(xs[0], 42)
        @Expect(xs[1], 43)
    }
    @TestCase
    func testPostingHighPriorityOrderFromSameThread() {
        let a = SequentialDispatcher(enableReceiverPriority: true)
        let xs = ArrayList<Int64>()
        a.post<Unit>({=> xs.add(42)}, priority: 6)
        let fut = a.post<Unit>({=> xs.add(43)}, priority: 5)
        fut.get()
        @Expect(xs[0], 42)
        @Expect(xs[1], 43)
    }
}
