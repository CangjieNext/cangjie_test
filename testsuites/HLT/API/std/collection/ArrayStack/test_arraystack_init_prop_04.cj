/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*
import std.math.*

@Test
class Test_arraystack_init_prop_04 {
    @TestCase
    func test_arraystack_init_notblank_01(): Unit {
        let arrstack = ArrayStack<String>(10)
        for (i in 0..50) {
            arrstack.add("${i}")
        }
        @Expect(arrstack.capacity, 73)
        @Expect(arrstack.size, 50)
        arrstack.reserve(0)
        @Expect(arrstack.capacity, 73)

        arrstack.reserve(-100)
        @Expect(arrstack.capacity, 73)

        arrstack.reserve(11)
        @Expect(arrstack.capacity, 73)

        arrstack.reserve(39)
        @Expect(arrstack.capacity, 109)

        arrstack.reserve(40)
        @Expect(arrstack.capacity, 109) //135
    }

    @TestCase
    func test_arraystack_init_notblank_02(): Unit {
        let arrstack = ArrayStack<String>(100)
        for (i in 0..50) {
            arrstack.add("${i}")
        }
        var iter = arrstack.iterator()
        @Expect(iter.next(), Option<String>.Some("49"))
        @Expect(iter.count(), 49)
    }

    @TestCase
    func test_arraystack_init_notblank_03(): Unit {
        let e = @AssertThrows[IllegalArgumentException](ArrayStack<Int64>(-100))
        @Expect(e.message.contains("The capacity must be greater than or equal to 0"))
    }
}
