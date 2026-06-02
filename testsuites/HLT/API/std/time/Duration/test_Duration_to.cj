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
class Duration_to_new_Test01 {
    let durMax = Duration.Max
    let durMin = Duration.Min
    let durZero = Duration.Zero

    @TestCase
    func toNan_case01(): Unit {
        try {
            let num1 = durMax.toNanoseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in nanosecond exceeds the range of 'Int64'.")
        }
        try {
            let num2 = durMin.toNanoseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in nanosecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func toMic_case02(): Unit {
        try {
            let num1 = durMax.toMicroseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in microsecond exceeds the range of 'Int64'.")
        }
        try {
            let num2 = durMin.toMicroseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in microsecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func toMil_case03(): Unit {
        try {
            let num1 = durMax.toMilliseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in millisecond exceeds the range of 'Int64'.")
        }
        try {
            let num2 = durMin.toMilliseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in millisecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func toSec_case03(): Unit {
        try {
            let num1 = durMax.toSeconds()
            @Expect(num1.toString(), "9223372036854775807")
        } catch (e: ArithmeticException) {
            @Expect(false)
        }
        try {
            let num2 = durMin.toSeconds()
            @Expect(num2.toString(), "-9223372036854775808")
        } catch (e: ArithmeticException) {
            @Expect(false)
        }
    }
}
