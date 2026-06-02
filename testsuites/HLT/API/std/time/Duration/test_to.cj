/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.random.*

@Test
class Test_to {
    @TestCase
    func test_toNanoseconds_01(): Unit {
        let duration = Duration.Zero
        let res = duration.toNanoseconds()
        @Assert(res, 0)
    }

    @TestCase
    func test_toNanoseconds_02(): Unit {
        let duration = Duration.Max
        try {
            duration.toNanoseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in nanosecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func test_toNanoseconds_03(): Unit {
        let duration = Duration.Min
        try {
            duration.toNanoseconds()
            @Expect(false)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The duration in nanosecond exceeds the range of 'Int64'.")
        }
    }

    @TestCase
    func test_toNanoseconds_04(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toNanoseconds()
        @Assert(res, random)
    }

    @TestCase
    func test_toMicroseconds_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toMicroseconds()
        @Assert(res, random/1000)
    }

    @TestCase
    func test_toMilliseconds_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toMilliseconds()
        @Assert(res, random/1000/1000)
    }

    @TestCase
    func test_toSeconds_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toSeconds()
        @Assert(res, random/1000/1000/1000)
    }

    @TestCase
    func test_toMinutes_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toMinutes()
        @Assert(res, random/1000/1000/1000/60)
    }

    @TestCase
    func test_toHours_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toHours()
        @Assert(res, random/1000/1000/1000/60/60)
    }

    @TestCase
    func test_toDays_01(): Unit {
        let r = Random()
        let random = r.nextInt64()
        let duration = Duration.nanosecond * random
        let res = duration.toDays()
        @Assert(res, random/1000/1000/1000/60/60/24)
    }
}
