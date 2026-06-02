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
 * Test description: Test the LinkedListNode.prev
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedListNode_prev_test {
    @TestCase
    func test_prev_nodeAt(): Unit {
        // 与nodeAt顺序一致
        let linkedlist = LinkedList<Int64>(36, {x => x})
        var node = linkedlist.lastNode.getOrThrow()
        var index = 35;
        while (index >= 0) {
            var x = node.value
            var y = linkedlist.nodeAt(index).getOrThrow().value
            @Expect(x, y)
            if (node.prev.isSome()) {
                node = node.prev.getOrThrow()
            }
            index--
        }
    }

    @TestCase
    func test_prev_head(): Unit {
        let linkedlist = LinkedList<Int64>(100, {x => x})
        let head = linkedlist.firstNode.getOrThrow()
        let head_prev = head.prev
        @Expect(head_prev.isNone(), true)
    }

    @TestCase
    func test_prev_exception(): Unit {
        let linkedlist = LinkedList<Int64>(3, {x => x})
        let head = linkedlist.firstNode.getOrThrow()
        linkedlist.removeFirst()
        var flag = false
        try {
            let head_prev = head.prev
        } catch (e: IllegalStateException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
