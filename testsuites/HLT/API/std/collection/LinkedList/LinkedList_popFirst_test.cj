/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the LinkedList.removeFirst()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_popFirst_test {
    @TestCase
    func test_popFirst_0(): Unit {
        let linkedlist = LinkedList<String>()
        let value = linkedlist.removeFirst()
        @Expect(value, None)
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_popFirst_1(): Unit {
        let linkedlist = LinkedList<Float64>([3.1415926])
        let value = linkedlist.removeFirst()
        @Expect(value, Some(3.1415926))
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_popFirst_16(): Unit {
        let linkedlist = LinkedList<Int64>(16, {x => x})
        let value = linkedlist.removeFirst()
        @Expect(value, Some(0))
        @Expect(linkedlist.size, 15)
        @Expect(linkedlist.isEmpty(), false)
    }
}
