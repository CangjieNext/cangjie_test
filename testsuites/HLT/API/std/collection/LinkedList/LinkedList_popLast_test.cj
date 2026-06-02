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
 * Test description: Test the LinkedList.removeLast()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_popLast_test {
    @TestCase
    func test_popLast_0(): Unit {
        let linkedlist = LinkedList<Rune>()
        let value = linkedlist.removeLast()
        @Expect(value, None)
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_popLast_1(): Unit {
        let linkedlist = LinkedList<Float64>([3.1415926])
        let value = linkedlist.removeLast()
        @Expect(value, Some(3.1415926))
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_popLast_16(): Unit {
        let linkedlist = LinkedList<Int64>(66, {x => x})
        let value = linkedlist.removeLast()
        @Expect(value, Some(65))
        @Expect(linkedlist.size, 65)
        @Expect(linkedlist.isEmpty(), false)
    }
}
