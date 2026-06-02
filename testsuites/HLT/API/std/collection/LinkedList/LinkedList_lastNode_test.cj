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
 * Test description: Test the LinkedList.lastNode
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_lastNode_test {
    @TestCase
    func test_lastNode_0(): Unit {
        let linkedlist = LinkedList<Rune>()
        let node1 = linkedlist.lastNode
        @Expect(node1.isNone(), true)
    }

    @TestCase
    func test_lastNode_1(): Unit {
        let linkedlist = LinkedList<String>(["just_test"])
        let node1 = linkedlist.lastNode.getOrThrow()
        @Expect(node1.value, "just_test")

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
        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, "just_test")
    }

    @TestCase
    func test_lastNode_99(): Unit {
        let linkedlist = LinkedList<Int64>(99, {x => x})
        let node1 = linkedlist.lastNode.getOrThrow()
        @Expect(node1.value, 98)

        let first_value = linkedlist.last.getOrThrow()
        @Expect(first_value, 98)
        let nodeAt_value = linkedlist.nodeAt(98).getOrThrow().value
        @Expect(nodeAt_value, 98)
        let popFirst_value = linkedlist.removeLast().getOrThrow()
        @Expect(popFirst_value, 98)
    }
}
