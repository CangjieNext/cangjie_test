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
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.time.*

class MyException <: Exception {}

@Test
public class ActorClassTest {

    @TestCase
    func testPostGetNormal() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            return 42
        })
        let res = fut.get()
        @Expect(res, 42)
    }

    @TestCase
    func testPostGetException() {
        let a = SequentialDispatcher()
        let fut = a.post<Unit>({ =>
            throw MyException()
        })
        @AssertThrows[MyException](fut.get())
    }

    @TestCase
    func testPostGetReady() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            return 42
        })
        fut.get()
        let res = fut.get()
        @Expect(res, 42)
    }

    @TestCase
    func testPostGetTimeoutNone() {
        let a = SequentialDispatcher()
        a.post<Int64>({ =>
            while (true) { sleep(Duration.second) }
            return 41
        })
        let fut = a.post<Int64>({ =>
            return 42
        })
        let res = fut.get(Duration.second)
        @Expect(res, Option<Int64>.None)
    }

    @TestCase
    func testPostGetTimeoutSome() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            sleep(Duration.second)
            return 42
        })
        let res = fut.get(Duration.second * 2)
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostGetTimeoutException() {
        let a = SequentialDispatcher()
        let fut = a.post<Unit>({ =>
            throw MyException()
        })
        @AssertThrows[MyException](fut.get(Duration.second * 2))
    }

    @TestCase
    func testPostGetTimeoutReady() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            return 42
        })
        fut.get()
        let res = fut.get(Duration.second * 2)
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostGetTimeoutZero() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            return 42
        })
        let res = fut.get(Duration.second * 0)
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostTryGetNone() {
        let a = SequentialDispatcher()
        a.post<Int64>({ =>
            while (true) { sleep(Duration.second) }
            return 41
        })
        let fut = a.post<Int64>({ =>
            return 42
        })
        let res = fut.tryGet()
        @Expect(res, Option<Int64>.None)
    }

    @TestCase
    func testPostTryGetSome() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            return 42
        })
        fut.get()
        let res = fut.tryGet()
        @Expect(res, Some(42))
    }

    @TestCase
    func testPostTryGetException() {
        let a = SequentialDispatcher()
        let fut = a.post<Unit>({ =>
            throw MyException()
        })
        @AssertThrows[MyException](fut.get())
        @AssertThrows[MyException](fut.tryGet())
    }

    @TestCase
    func testPostError() {
        let a = SequentialDispatcher()
        let fut = a.post<Int64>({ =>
            func test(): Int64 {
                test() + 1
            }
            test()
        })
        @AssertThrows[StackOverflowError](fut.get())
        @AssertThrows[StackOverflowError](fut.get(Duration.Zero))
        @AssertThrows[StackOverflowError](fut.tryGet())
    }

    @TestCase
    func testPostingOrderFromSameThread() {
        let a = SequentialDispatcher()
        let xs = ArrayList<Int64>()
        a.post<Unit>({ => xs.add(42) })
        let fut = a.post<Unit>({ => xs.add(43) })
        fut.get()
        @Expect(xs[0], 42)
        @Expect(xs[1], 43)
    }

    @TestCase
    func testSemaphoreWait() {
        let a = SequentialDispatcher()
        sleep(Duration.second * 2)
    }
}