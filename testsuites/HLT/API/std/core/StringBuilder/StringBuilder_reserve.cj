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
import std.math.*

@Test
class Test_stringBuilder_reserve {
    @TestCase
    func test_stringBuilder_notreserve(): Unit {
        let str = StringBuilder(10)
        str.append('a')
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        str.reserve(0)
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        str.reserve(-1)
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")
    }

    @TestCase
    func test_stringBuilder_reserve(): Unit {
        let str = StringBuilder(10)
        str.append('a')
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        // not expansion
        str.reserve(8)
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        // not expansion
        str.reserve(9)
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        // Capacity expansion by 1.5 times
        str.reserve(10)
        @Expect(str.size, 1)
        @Expect(str.capacity, 15)
        @Expect(str.toString(), "a")

        // Capacity expansion by 1.5 times, Round Down
        str.reserve(15)
        @Expect(str.size, 1)
        @Expect(str.capacity, 22)
        @Expect(str.toString(), "a")

        // Capacity expansion to size + additional
        str.reserve(100)
        @Expect(str.size, 1)
        @Expect(str.capacity, 101)
        @Expect(str.toString(), "a")
    }

    @TestCase
    func test_stringBuilder_reserve_and_reset(): Unit {
        // init
        let str = StringBuilder(10)
        str.append('a')
        @Expect(str.size, 1)
        @Expect(str.capacity, 10)
        @Expect(str.toString(), "a")

        // reset
        str.reset()
        @Expect(str.size, 0)
        @Expect(str.capacity, 32)
        @Expect(str.toString(), "")

        // reserve
        str.reserve(100)
        @Expect(str.size, 0)
        @Expect(str.capacity, 100)
        @Expect(str.toString(), "")
    }
}
