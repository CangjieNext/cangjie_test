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
 * Test description: Test the LinkedListNode.next
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedListNode_next_test {
    @TestCase
    func test_next_iterator(): Unit {
        // 与iterator顺序一致
        let linkedlist = LinkedList<Int64>(26, {x => x})
        var itor001 = linkedlist.iterator()
        var x = itor001.next()
        var node = linkedlist.firstNode.getOrThrow()
        var index = 0
        while (index < 26) {
            @Expect(x.getOrThrow(), node.value)
            x = itor001.next()
            if (node.next.isSome()) {
                node = node.next.getOrThrow()
            }
            index++
        }
    }

    @TestCase
    func test_next_nodeAt(): Unit {
        // 与nodeAt顺序一致
        let linkedlist = LinkedList<Int64>(18, {x => x})
        var node = linkedlist.firstNode.getOrThrow()
        var index = 0;
        while (index < 18) {
            var x = node.value
            var y = linkedlist.nodeAt(index).getOrThrow().value
            @Expect(x, y)
            if (node.next.isSome()) {
                node = node.next.getOrThrow()
            }
            index++
        }
    }

    @TestCase
    func test_next_tail(): Unit {
        let linkedlist = LinkedList<Int64>(100, {x => x})
        let tail = linkedlist.lastNode.getOrThrow()
        let tail_next = tail.next
        @Expect(tail_next.isNone(), true)
    }

    @TestCase
    func test_next_exception(): Unit {
        let linkedlist = LinkedList<Int64>(3, {x => x})
        let tail = linkedlist.lastNode.getOrThrow()
        linkedlist.removeLast()
        var flag = false
        try {
            let tail_next = tail.next
        } catch (e: IllegalStateException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
