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
class MonoTime_Operate_Test {
    let basem1 = MonoTime.now()
    let basem2 = basem1 + Duration.microsecond * 5
    let duraMax = Duration.Max
    let durMin = Duration.Min
    let durZero = Duration.Zero

    @TestCase
    func addDuration_case(): Unit {
        let m3 = basem1 + Duration.microsecond * 5
        @Expect(basem2, m3)
        let m4 = basem1 + durZero
        @Expect(basem1, m4)
        try {
            let m5 = basem1 + duraMax
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
        try {
            let m6 = basem1 + durMin
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
        let m11 = m3 + Duration.second - Duration.second
        @Expect(m11, m3)
    }

    @TestCase
    func subMonoTime_case(): Unit {
        let dur1 = basem2 - basem1
        @Expect(dur1, Duration.microsecond * 5)
        let dur2 = basem1 - basem1
        @Expect(dur2, durZero)
        let dur3 = basem1 - basem2
        @Expect(dur3.toString(), "-5us")
    }

    @TestCase
    func subDuration_case(): Unit {
        let m7 = basem2 - Duration.microsecond * 5
        @Expect(basem1, m7)
        let m8 = basem1 - durZero
        @Expect(basem1, m8)
        try {
            let m9 = basem1 - duraMax
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
        try {
            let m10 = basem1 - durMin
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The result exceeds the range of 'MonoTime'.")
        }
        let m12 = m7 - Duration.second + Duration.second
        @Expect(m7, m12)
    }
}
