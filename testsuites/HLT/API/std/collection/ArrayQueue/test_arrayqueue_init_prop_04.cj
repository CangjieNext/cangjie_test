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
class Test_arrayqueue_init_prop_04 {
    @TestCase
    func test_arrayqueue_init_notblank_01(): Unit {
        let arrqueue = ArrayQueue<String>(10)
        for (i in 0..50) {
            arrqueue.add("${i}")
        }
        @Expect(arrqueue.capacity, 73)
        @Expect(arrqueue.size, 50)
        arrqueue.reserve(0)
        @Expect(arrqueue.capacity, 73)

        arrqueue.reserve(-100)
        @Expect(arrqueue.capacity, 73)

        arrqueue.reserve(11)
        @Expect(arrqueue.capacity, 73)

        arrqueue.reserve(39)
        @Expect(arrqueue.capacity, 109)

        arrqueue.reserve(40)
        @Expect(arrqueue.capacity, 109) //135
    }

    @TestCase
    func test_arrayqueue_init_notblank_02(): Unit {
        let arrqueue = ArrayQueue<String>(100)
        for (i in 0..50) {
            arrqueue.add("${i}")
        }
        var iter = arrqueue.iterator()
        @Expect(iter.next(), Option<String>.Some("0"))
        @Expect(iter.count(), 49)
    }

    @TestCase
    func test_arrayqueue_init_notblank_03(): Unit {
        let e = @AssertThrows[IllegalArgumentException](ArrayQueue<Int64>(-100))
        println(e.message)
        //@Expect(e.message.contains("Invalid capacity of ArrayQueue"))           
    }
}
