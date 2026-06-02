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
 * Test description: Test the LinkedList.addLast()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_append_test {
    @TestCase
    func test_append_0(): Unit {
        var linkedlist = LinkedList<String>()
        linkedlist.addFirst("just_test")
        @Expect(linkedlist.size, 1)

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, "just_test")
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, "just_test")
        let nodeAt_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_value, "just_test")
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, "just_test")
        linkedlist.addFirst("just_test") // 弹出再加入
        let popLast_value = linkedlist.removeLast().getOrThrow()
        @Expect(popLast_value, "just_test")
        linkedlist.addFirst("just_test") // 弹出再加入
        let lastNode_value = linkedlist.lastNode.getOrThrow().value
        @Expect(lastNode_value, "just_test")
        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, "just_test")
    }

    @TestCase
    func test_append_7(): Unit {
        var linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        linkedlist.addFirst(8)
        @Expect(linkedlist.size, 8)

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, 8)
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, 8)
        let nodeAt_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_value, 8)
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, 8)
        linkedlist.addFirst(8) // 弹出再加入
    }
}
