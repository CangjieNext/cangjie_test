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
 * Test description: Test the LinkedList.reverse()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_reverse_test {
    @TestCase
    func test_reverse_0(): Unit {
        let linkedlist = LinkedList<String>()
        linkedlist.reverse()
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_reverse_1(): Unit {
        let linkedlist = LinkedList<String>(["just_test"])
        linkedlist.reverse()
        @Expect(linkedlist.isEmpty(), false)

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
    func test_reverse_9(): Unit {
        let linkedlist = LinkedList<Int64>(9, {x => x})
        linkedlist.reverse()
        @Expect(linkedlist.size, 9)
        @Expect(linkedlist.isEmpty(), false)

        let itor = linkedlist.iterator()
        for (i in 8..-1 : -1) {
            let x = itor.next().getOrThrow()
            @Expect(x, i)
        }

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, 8)
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, 8)
        let nodeAt_head_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_head_value, 8)
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, 8)
        linkedlist.addFirst(popFirst_value)
        let popLast_value = linkedlist.removeLast().getOrThrow()
        @Expect(popLast_value, 0)
        linkedlist.addLast(popLast_value)
        let nodeAt_tail_value = linkedlist.nodeAt(8).getOrThrow().value
        @Expect(nodeAt_tail_value, 0)
        let lastNode_value = linkedlist.lastNode.getOrThrow().value
        @Expect(lastNode_value, 0)
        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, 0)
    }

    @TestCase
    func test_reverse_10(): Unit {
        let linkedlist = LinkedList<Int64>(10, {x => x})
        linkedlist.reverse()
        @Expect(linkedlist.size, 10)
        @Expect(linkedlist.isEmpty(), false)

        let itor = linkedlist.iterator()
        for (i in 9..-1 : -1) {
            let x = itor.next().getOrThrow()
            @Expect(x, i)
        }

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, 9)
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, 9)
        let nodeAt_head_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_head_value, 9)
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, 9)
        linkedlist.addFirst(popFirst_value)
        let popLast_value = linkedlist.removeLast().getOrThrow()
        @Expect(popLast_value, 0)
        linkedlist.addLast(popLast_value)
        let nodeAt_tail_value = linkedlist.nodeAt(9).getOrThrow().value
        @Expect(nodeAt_tail_value, 0)
        let lastNode_value = linkedlist.lastNode.getOrThrow().value
        @Expect(lastNode_value, 0)
        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, 0)
    }

    @TestCase
    func test_reverse_after_addLast(): Unit {
        let linkedlist = LinkedList<Int64>(9, {x => x})
        linkedlist.addLast(-1)
        linkedlist.reverse()

        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, -1)
        let firstNode_value = linkedlist.firstNode.getOrThrow().value
        @Expect(firstNode_value, -1)
        let nodeAt_head_value = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeAt_head_value, -1)
        let popFirst_value = linkedlist.removeFirst().getOrThrow()
        @Expect(popFirst_value, -1)
    }

    @TestCase
    func test_reverse_after_addFirst(): Unit {
        let linkedlist = LinkedList<Int64>(10, {x => x})
        linkedlist.addFirst(-1)
        linkedlist.reverse()

        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, -1)
        let nodeAt_tail_value = linkedlist.nodeAt(10).getOrThrow().value
        @Expect(nodeAt_tail_value, -1)
        let lastNode_value = linkedlist.lastNode.getOrThrow().value
        @Expect(lastNode_value, -1)
        let popLast_value = linkedlist.removeLast().getOrThrow()
        @Expect(popLast_value, -1)
    }

    @TestCase
    func test_reverse_after_reverse(): Unit {
        let linkedlist_src = LinkedList<Int64>(11, {x => x})
        let linkedlist = LinkedList<Int64>(11, {x => x})
        let old_s = linkedlist.toString()
        linkedlist.reverse()
        linkedlist.reverse()
        let new_s = linkedlist.toString()
        @Expect(old_s, new_s)
        let flag = linkedlist_src == linkedlist
        @Expect(flag, true)
        let itor = linkedlist.iterator()
        for (i in 0..11) {
            let x = itor.next().getOrThrow()
            @Expect(x, i)
        }
    }

    @TestCase
    func test_reverse_removeHead(): Unit {
        let linkedlist = LinkedList<Int64>(12, {x => x})
        let head = linkedlist.firstNode.getOrThrow()
        linkedlist.reverse()
        linkedlist.remove(head)
        @Expect(linkedlist.first, Some(11))
        @Expect(linkedlist.last, Some(1))
    }
}
