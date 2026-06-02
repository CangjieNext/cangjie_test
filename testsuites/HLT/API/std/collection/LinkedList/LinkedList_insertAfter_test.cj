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
 * Test description: Test the LinkedList.addAfter()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_insertAfter_test {
    @TestCase
    func test_insertAfter_head(): Unit {
        let linkedlist = LinkedList<String>(["yao", "yao", "ling", "xian"])
        let node = linkedlist.firstNode.getOrThrow()
        let node1 = linkedlist.addAfter(node, "just_test")
        @Expect(linkedlist.size, 5)
        @Expect(node1.value, "just_test")
    }

    @TestCase
    func test_insertAfter_mid(): Unit {
        let linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        let node = linkedlist.nodeAt(3).getOrThrow()
        let node1 = linkedlist.addAfter(node, 10)
        @Expect(linkedlist.size, 8)
        @Expect(node1.value, 10)
        let node2 = linkedlist.nodeAt(4).getOrThrow()
        @Expect(node2.value, 10)
    }

    @TestCase
    func test_insertAfter_tail(): Unit {
        let linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        let node = linkedlist.lastNode.getOrThrow()
        let node1 = linkedlist.addAfter(node, 10)
        @Expect(linkedlist.size, 8)
        @Expect(node1.value, 10)

        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, 10)
        let lastNode_value = linkedlist.lastNode.getOrThrow().value
        @Expect(lastNode_value, 10)
        let nodeAt_value = linkedlist.nodeAt(7).getOrThrow().value
        @Expect(nodeAt_value, 10)
        let popLast_value = linkedlist.removeLast().getOrThrow()
        @Expect(popLast_value, 10)
        linkedlist.addAfter(node, 10) // 弹出再加入
    }

    @TestCase
    func test_insertAfter_notInList(): Unit {
        var flag = false
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let other_linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = other_linkedlist.firstNode.getOrThrow()
        try {
            let node1 = linkedlist.addAfter(node, "just_test")
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_insertAfter_afterRemove(): Unit {
        var flag = false
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = linkedlist.lastNode.getOrThrow()
        linkedlist.remove(node)
        try {
            let node1 = linkedlist.addAfter(node, "just_test")
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
