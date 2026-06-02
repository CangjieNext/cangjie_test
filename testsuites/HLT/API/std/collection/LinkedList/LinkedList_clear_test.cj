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
 * Test description: Test the LinkedList.clear()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_clear_test {
    @TestCase
    func test_clear_0(): Unit {
        let linkedlist = LinkedList<String>()
        linkedlist.clear()
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_clear_100(): Unit {
        let linkedlist = LinkedList<Int64>(100, {x => x})
        @Expect(linkedlist.size, 100)
        @Expect(linkedlist.isEmpty(), false)
        linkedlist.clear()
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
        // 头尾清空
        let first_value = linkedlist.first.isNone()
        @Expect(first_value, true)
        let firstNode_value = linkedlist.firstNode.isNone()
        @Expect(firstNode_value, true)
        let nodeAt_value = linkedlist.nodeAt(0).isNone()
        @Expect(nodeAt_value, true)
        let popFirst_value = linkedlist.removeFirst().isNone()
        @Expect(popFirst_value, true)
        let popLast_value = linkedlist.removeLast().isNone()
        @Expect(popLast_value, true)
        let lastNode_value = linkedlist.lastNode.isNone()
        @Expect(lastNode_value, true)
        let last_value = linkedlist.last.isNone()
        @Expect(last_value, true)
    }
}
