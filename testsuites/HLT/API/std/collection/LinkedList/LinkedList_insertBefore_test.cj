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
 * Test description: Test the LinkedList.addBefore()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_insertBefore_test {
    @TestCase
    func test_insertBefore_head(): Unit {
        let linkedlist = LinkedList<String>(["yao", "yao", "ling", "xian"])
        let node = linkedlist.firstNode.getOrThrow()
        let node1 = linkedlist.addBefore(node, "just_test")
        @Expect(linkedlist.size, 5)
        @Expect(node1.value, "just_test")

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, "just_test")
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, "just_test")
        let nodeAt_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_value, "just_test")
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, "just_test")
        linkedlist.addBefore(node, "just_test") // 弹出再加入
    }

    @TestCase
    func test_insertBefore_mid(): Unit {
        let linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        let node = linkedlist.nodeAt(3).getOrThrow()
        let node1 = linkedlist.addBefore(node, 10)
        @Expect(linkedlist.size, 8)
        @Expect(node1.value, 10)
        let node2 = linkedlist.nodeAt(3).getOrThrow()
        @Expect(node2.value, 10)
    }

    @TestCase
    func test_insertBefore_tail(): Unit {
        let linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        let node = linkedlist.lastNode.getOrThrow()
        let node1 = linkedlist.addBefore(node, 10)
        @Expect(linkedlist.size, 8)
        @Expect(node1.value, 10)
    }

    @TestCase
    func test_insertBefore_notInList(): Unit {
        var flag = false
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let other_linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = other_linkedlist.firstNode.getOrThrow()
        try {
            let node1 = linkedlist.addBefore(node, "just_test")
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_insertBefore_afterRemove(): Unit {
        var flag = false
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = linkedlist.firstNode.getOrThrow()
        linkedlist.remove(node)
        try {
            let node1 = linkedlist.addBefore(node, "just_test")
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
