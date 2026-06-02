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
class MonoTime_prop_Test {
    @TestCase
    func changeTime_case01(): Unit {
        let m1 = MonoTime.now()
        sleep(Duration.microsecond * 2)
        let m2 = MonoTime.now()
        @Expect(m2 > m1)
    }

    @TestCase
    func changeTime_case02(): Unit {
        let m3 = MonoTime.now()
        sleep(Duration.microsecond * 2)
        let m4 = MonoTime.now()
        @Expect(m4 > m3)
    }

    @TestCase
    func hashcode_MonoTime_case() {
        let m5 = MonoTime.now()
        let hashNum = m5.hashCode()
        let hashNum2 = m5.hashCode()
        @Expect(hashNum, hashNum2)
        let m6 = m5 + Duration.second - Duration.second
        @Expect(m5.hashCode(), m6.hashCode())
        let m7 = m5 + Duration.Zero
        @Expect(m5.hashCode(), m7.hashCode())
        let m8 = m5 - Duration.Zero
        @Expect(m5.hashCode(), m8.hashCode())
    }
}
