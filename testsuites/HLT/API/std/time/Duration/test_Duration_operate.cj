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
import std.math.*

@Test
class Duration_operate_new_Test01 {
    @TestCase
    func duration_mul_01(): Unit {
        let duration1 = Int64(Int32.Max) * Duration.nanosecond
        @Expect(duration1.toNanoseconds(), Int64(Int32.Max))
        @Expect(duration1.toString(), "2s147ms483us647ns")
        let duration2 = Int64(Int32.Min) * Duration.nanosecond
        @Expect(duration2.toNanoseconds(), Int64(Int32.Min))
        @Expect(duration2.toString(), "-2s147ms483us648ns")

        let duration3 = Int64.Max * Duration.second
        @Expect(duration3.toSeconds(), Int64.Max)
        @Expect(duration3.toString(), "106751991167300d15h30m7s")

        let duration4 = Int64(Int32.Min) * Duration.second
        @Expect(duration4.toSeconds(), Int64(Int32.Min))
        @Expect(duration4.toString(), "-24855d3h14m8s")
    }

    @TestCase
    func duration_mul_02(): Unit {
        let duration5 = Int64(UInt32.Max) * Duration.nanosecond
        @Expect(duration5.toNanoseconds(), Int64(UInt32.Max))
        @Expect(duration5.toString(), "4s294ms967us295ns")
        let duration6 = Int64.Max * Duration.second
        @Expect(duration6.toSeconds(), Int64.Max)
        @Expect(duration6.toString(), "106751991167300d15h30m7s")
        try {
            let duration7 = duration5 + duration6
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Out of range of representation of 'Duration'!")
        }
    }

    @TestCase
    func duration_add_03(): Unit {
        let duration8 = Int64.Max * Duration.second
        let duration9 = Duration.nanosecond * 999999999
        let duration10 = duration8 + duration9
        try {
            let duration11 = duration8 + duration9 + Duration.nanosecond
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Out of range of representation of 'Duration'!")
        }
    }

    @TestCase
    func duration_sub_04(): Unit {
        let duration12 = Int64.Min * Duration.second
        try {
            let duration13 = duration12 - Duration.nanosecond
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "Out of range of representation of 'Duration'!")
        }
    }

    @TestCase
    func duration_mul_05(): Unit {
        let duration14 = (10 ** 9 - 1) * Duration.nanosecond
        let duration15 = duration14 * Int64.Max
        @Expect(duration15.toString(), "106751991060548d15h42m50s145ms224us193ns")
    }

    @TestCase
    func duration_mul_06(): Unit {
        let duration16 = (10 ** 9 - 1) * Duration.nanosecond
        let duration17 = duration16 * (10 ** 9)
        @Expect(duration17.toString(), "11574d1h46m39s")
    }

    @TestCase
    func duration_mul_07(): Unit {
        let duration18 = (10 ** 9 - 1) * Duration.nanosecond
        let duration19 = duration18 * (10 ** 9 + 1)
        @Expect(duration19.toString(), "11574d1h46m39s999ms999us999ns")
    }

    @TestCase
    func duration_mul_08(): Unit {
        let duration20 = (10 ** 9 - 1) * Duration.nanosecond
        let duration21 = duration20 * (10 ** 9 - 1)
        @Expect(duration21.toString(), "11574d1h46m38s1ns")
    }

    @TestCase
    func duration_mul_09(): Unit {
        let duration22 = (10 ** 9 + 1) * Duration.nanosecond
        let duration23 = duration22 * 0.1
        @Expect(duration23.toString(), "100ms")
    }

    @TestCase
    func duration_mul_10(): Unit {
        let duration24 = (10 ** 9 - 1) * Duration.nanosecond
        let duration25 = duration24 * 0.1
        @Expect(duration25.toString(), "99ms999us999ns")
    }

    @TestCase
    func duration_div_11(): Unit {
        let duration26 = (10 ** 9 - 1) * Duration.nanosecond
        let duration27 = duration26 / 0.1
        @Expect(duration27.toString(), "9s999ms999us990ns")
    }

    @TestCase
    func duration_div_12(): Unit {
        let duration28 = (10 ** 9 + 1) * Duration.nanosecond
        let duration29 = duration28 / 0.1
        @Expect(duration29.toString(), "10s10ns")
    }

    @TestCase
    func duration_div_14(): Unit {
        let duration30 = (Int64(UInt32.Max) + 1) * Duration.second
        let duration31 = duration30 / Int64(UInt32.Max)
        @Expect(duration31.toString(), "1s")
    }

    @TestCase
    func duration_div_15(): Unit {
        let duration32 = (Int64(UInt32.Max) - 1) * Duration.second
        let duration33 = duration32 / Int64(UInt32.Max)
        @Expect(duration33.toString(), "999ms999us999ns")
    }
}
