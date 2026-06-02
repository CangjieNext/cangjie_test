/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

import std.time.*
import std.collection.*
import std.sync.*

@Test
class MonoTime_CompareOperate_Test {
    @TestCase
    func euqale_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 == m1, true)
        @Expect(m1 == m2, false)
        @Expect(m0 == m3, false)
    }

    @TestCase
    func noeuqale_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 != m1, false)
        @Expect(m1 != m3, true)
        @Expect(m0 != m3, true)
    }

    @TestCase
    func greateuqale_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 >= m1, true)
        @Expect(m1 >= m3, false)
        @Expect(m3 >= m0, true)
    }

    @TestCase
    func great_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 > m1, false)
        @Expect(m1 > m3, false)
        @Expect(m3 > m0, true)
    }

    @TestCase
    func lessequal_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 <= m1, true)
        @Expect(m1 <= m3, true)
        @Expect(m3 <= m0, false)
    }

    @TestCase
    func less_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0 < m1, false)
        @Expect(m1 < m3, true)
        @Expect(m3 < m0, false)
    }

    @TestCase
    func compare_case(): Unit {
        let m0 = MonoTime.now()
        let m2 = m0 + Duration.second
        let m1 = m2 - Duration.second
        sleep(Duration.microsecond * 2)
        let m3 = MonoTime.now()
        // m0 = m1 < m2 < m3
        @Expect(m0.compare(m1), Ordering.EQ)
        @Expect(m0.compare(m0), Ordering.EQ)
        @Expect(m3.compare(m0), Ordering.GT)
        @Expect(m1.compare(m3), Ordering.LT)
    }
}
