/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.time.*

@Test
class MonoTimeTest {
    @TestCase
    func testNow(): Unit {
        let m1 = MonoTime.now()
        let m2 = MonoTime.now()
        let dur = m2 - m1
        @Expect(dur.toNanoseconds() >= 0, true)
    }

    @TestCase
    func testAddDuration(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second
        @Expect(m2 > m1, true)
    }

    @TestCase
    func testAddDurationException(): Unit {
        try {
            MonoTime.now() + Duration.Max
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
    }

    @TestCase
    func testSubDuration(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 - Duration.second
        @Expect(m2 < m1, true)
    }

    @TestCase
    func testSubDurationException1(): Unit {
        try {
            MonoTime.now() - Duration.Max
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
    }

    @TestCase
    func testSubDurationException2(): Unit {
        try {
            MonoTime.now() - Duration.Min
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
    }

    @TestCase
    func testSubMonoTime(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second
        @Expect(m2 - m1, Duration.second)
    }

    @TestCase
    func testComparison(): Unit {
        let m1 = MonoTime.now()
        let m2 = MonoTime.now()
        @Expect(m2 >= m1, true)

        @Expect(m1 <= m2, true)

        var m3 = m1 + Duration.second
        @Expect(m3 > m1)

        m3 = m1 - Duration.second
        @Expect(m3 < m1)
    }

    @TestCase
    func testCompareFunc(): Unit {
        let m1 = MonoTime.now()
        var m2 = m1 + Duration.second
        @Expect(m1.compare(m2), Ordering.LT)

        m2 = m2 - Duration.second
        @Expect(m1.compare(m2), Ordering.EQ)

        m2 = m2 - Duration.second
        @Expect(m1.compare(m2), Ordering.GT)
    }

    @TestCase
    func testHashCode(): Unit {
        let m1 = MonoTime.now()
        let m2 = m1 + Duration.second - Duration.second
        @Expect(m1.hashCode(), m2.hashCode())
    }
}
