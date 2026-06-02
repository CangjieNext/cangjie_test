/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_UnixTimeStamp_01 {
    //1970/01/01/00:00:00 - location：UTC
    @TestCase
    func case1(): Unit {
        var time = DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: TimeZone.load("UTC"))
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, 0)
        @Expect(durMicro, 0)
        @Expect(durMilli, 0)
        @Expect(durSec, 0)
    }

    //1970/01/01/00:00:00 - location：Pacific/Chatham
    @TestCase
    func case2(): Unit {
        var custom = TimeZone("Pacific/Chatham", Duration.second * 49500)
        var time = DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: custom)
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, -49500000000000)
        @Expect(durMicro, -49500000000)
        @Expect(durMilli, -49500000)
        @Expect(durSec, -49500)
    }

    //1960/01/01/00:00:00 - location：UTC
    @TestCase
    func case3(): Unit {
        var time = DateTime.of(year: 1960, month: Month.of(1), dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: TimeZone.load("UTC"))
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, -315619200000000000)
        @Expect(durMicro, -315619200000000)
        @Expect(durMilli, -315619200000)
        @Expect(durSec, -315619200)
    }

    //1960/01/01/00:00:00 - location：Pacific/Kiritimati
    @TestCase
    func case4(): Unit {
        var custom = TimeZone("Pacific/Kiritimati", Duration.second * 50400)
        var time = DateTime.of(year: 1960, month: Month.of(1), dayOfMonth: 1, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: custom)
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, -315669600000000000)
        @Expect(durMicro, -315669600000000)
        @Expect(durMilli, -315669600000)
        @Expect(durSec, -315669600)
    }

    //2260/12/31/23:59:59 - location：UTC
    @TestCase
    func case5(): Unit {
        var time = DateTime.of(year: 2260, month: Month.of(12), dayOfMonth: 31, hour: 23, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: TimeZone.load("UTC"))
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, 9183110399999999999)
        @Expect(durMicro, 9183110399999999)
        @Expect(durMilli, 9183110399999)
        @Expect(durSec, 9183110399)
    }

    //2260/12/31/23:59:59 - location：Pacific/Midway
    @TestCase
    func case6(): Unit {
        var custom = TimeZone("Pacific/Midway", Duration.second * (-39600))
        var time = DateTime.of(year: 2261, month: Month.of(1), dayOfMonth: 1, hour: 0, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: custom)
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, 9183153599999999999)
        @Expect(durMicro, 9183153599999999)
        @Expect(durMilli, 9183153599999)
        @Expect(durSec, 9183153599)
    }

    //nanosec - Int64.Max 9223 372 036 854 775 807
    @TestCase
    func case7(): Unit {
        var time = DateTime.ofUTC(year: 2262, month: Month.of(4), dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775807)
        var durNano = time.toUnixTimeStamp().toNanoseconds()
        var durMicro = time.toUnixTimeStamp().toMicroseconds()
        var durMilli = time.toUnixTimeStamp().toMilliseconds()
        var durSec = time.toUnixTimeStamp().toSeconds()
        @Expect(durNano, 9223372036854775807)
        @Expect(durMicro, 9223372036854775)
        @Expect(durMilli, 9223372036854)
        @Expect(durSec, 9223372036)
    }

    //nanosec - Int64.Max + 1
    @TestCase
    func case8(): Unit {
        var time1 = DateTime.ofUTC(year: 2262, month: Month.of(4), dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775808)
        var dur = time1.toUnixTimeStamp()
        var sec_part = dur.toSeconds()
        var ns_part = (dur - Duration.second * sec_part).toNanoseconds()
        @Expect(sec_part, 9223372036) // (Int64.Max + 1) / 10 ^ 9
        @Expect(ns_part, 854775808) // (Int64.Max + 1) % 10 ^ 9

        var custom2 = TimeZone("+1", Duration.second * (-1))
        var time2 = DateTime.of(year: 2262, month: Month.of(4), dayOfMonth: 11, hour: 23, minute: 47, second: 16,
            nanosecond: 854775807, timeZone: custom2)
        dur = time2.toUnixTimeStamp()
        sec_part = dur.toSeconds()
        ns_part = (dur - Duration.second * sec_part).toNanoseconds()
        @Expect(sec_part, 9223372037) // (Int64.Max + 10 ^ 9) / 10 ^ 9
        @Expect(ns_part, 854775807) // (Int64.Max + 10 ^ 9) % 10 ^ 9

        var custom3 = TimeZone("-1", Duration.second * (1))
        var time3 = DateTime.of(year: 2262, month: Month.of(4), dayOfMonth: 11, hour: 23, minute: 47, second: 17,
            nanosecond: 854775807, timeZone: custom3)
        var durNano = time3.toUnixTimeStamp().toNanoseconds()
        @Expect(durNano, 9223372036854775807)
    }
}
