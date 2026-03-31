/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

import std.sync.AtomicBool

@Test
class ThreadLocalRemoveSizeTest {
    @TestCase
    func testThreadLocalRemoveSizeDecrement(): Unit {
        let tl1 = ThreadLocal<Int64>()
        let tl2 = ThreadLocal<String>()
        let tl3 = ThreadLocal<Bool>()

        tl1.set(100)
        tl2.set("test")
        tl3.set(true)

        @Expect(tl1.get(), Some(100))
        @Expect(tl2.get(), Some("test"))
        @Expect(tl3.get(), Some(true))

        tl1.set(None)
        @Expect(tl1.get(), None)
        @Expect(tl2.get(), Some("test"))
        @Expect(tl3.get(), Some(true))

        tl2.set(None)
        @Expect(tl1.get(), None)
        @Expect(tl2.get(), None)
        @Expect(tl3.get(), Some(true))

        tl3.set(None)
        @Expect(tl1.get(), None)
        @Expect(tl2.get(), None)
        @Expect(tl3.get(), None)
    }

    @TestCase
    func testThreadLocalRepeatedSetRemove(): Unit {
        let tl = ThreadLocal<Int64>()

        for (i in 0..100) {
            tl.set(i)
            @Expect(tl.get(), Some(i))
            tl.set(None)
            @Expect(tl.get(), None)
        }

        tl.set(999)
        @Expect(tl.get(), Some(999))
    }

    @TestCase
    func testThreadLocalMultipleSetRemove(): Unit {
        let tl1 = ThreadLocal<Int64>()
        let tl2 = ThreadLocal<Int64>()
        let tl3 = ThreadLocal<Int64>()

        for (i in 0..50) {
            tl1.set(i)
            tl2.set(i * 2)
            tl3.set(i * 3)

            @Expect(tl1.get(), Some(i))
            @Expect(tl2.get(), Some(i * 2))
            @Expect(tl3.get(), Some(i * 3))

            if (i % 2 == 0) {
                tl1.set(None)
                @Expect(tl1.get(), None)
            }
            if (i % 3 == 0) {
                tl2.set(None)
                @Expect(tl2.get(), None)
            }
            if (i % 5 == 0) {
                tl3.set(None)
                @Expect(tl3.get(), None)
            }
        }
    }

    @TestCase
    func testThreadLocalRemoveNonExistent(): Unit {
        let tl = ThreadLocal<Int64>()

        @Expect(tl.get(), None)

        tl.set(None)
        @Expect(tl.get(), None)

        tl.set(42)
        @Expect(tl.get(), Some(42))

        tl.set(None)
        @Expect(tl.get(), None)

        tl.set(None)
        @Expect(tl.get(), None)
    }

    @TestCase
    func testThreadLocalSetAfterRemove(): Unit {
        let tl = ThreadLocal<Int64>()

        for (i in 0..20) {
            tl.set(i)
            @Expect(tl.get(), Some(i))
            tl.set(None)
            @Expect(tl.get(), None)
            tl.set(i + 100)
            @Expect(tl.get(), Some(i + 100))
            tl.set(None)
            @Expect(tl.get(), None)
        }
    }

    @TestCase
    func testThreadLocalDifferentTypes(): Unit {
        let tlInt = ThreadLocal<Int64>()
        let tlString = ThreadLocal<String>()
        let tlArray = ThreadLocal<Array<Int64>>()

        tlInt.set(123)
        tlString.set("hello")
        tlArray.set([1, 2, 3, 4, 5])

        @Expect(tlInt.get(), Some(123))
        @Expect(tlString.get(), Some("hello"))
        let arr = tlArray.get()
        if (let Some(a) <- arr) {
            @Expect(a.size, 5)
            @Expect(a[0], 1)
            @Expect(a[4], 5)
        } else {
            @Expect(false, true)
        }

        tlInt.set(None)
        tlString.set(None)
        tlArray.set(None)

        @Expect(tlInt.get(), None)
        @Expect(tlString.get(), None)
        @Expect(tlArray.get(), None)
    }

    @TestCase
    func testThreadLocalInSpawn(): Unit {
        let tl = ThreadLocal<Int64>()
        let finished = AtomicBool(false)

        tl.set(0)

        let fut = spawn {
            tl.set(100)
            sleep(Duration.millisecond * 50)
            @Expect(tl.get(), Some(100))
            tl.set(None)
            @Expect(tl.get(), None)
            tl.set(200)
            @Expect(tl.get(), Some(200))
            finished.store(true)
            return
        }

        @Expect(tl.get(), Some(0))
        tl.set(1)
        @Expect(tl.get(), Some(1))

        fut.get()
        @Expect(finished.load(), true)
        @Expect(tl.get(), Some(1))
    }
}
