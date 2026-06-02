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
 * Test description: Test the LinkedListNode.forward
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedListNode_forward_test {
    @TestCase
    func test_forward_head(): Unit {
        let linkedlist = LinkedList<Int64>(36, {x => x})
        let tail_forward = linkedlist.backward(linkedlist.lastNode.getOrThrow())
        for (i in 35..0 : -1) {
            let x = tail_forward.next()
            @Expect(x.getOrThrow(), i)
        }
    }

    @TestCase
    func test_forward_mid(): Unit {
        let linkedlist = LinkedList<Int64>(72, {x => x})
        let node_forward = linkedlist.backward(linkedlist.nodeAt(36).getOrThrow())
        for (i in 36..-1 : -1) {
            let x = node_forward.next()
            @Expect(x.getOrThrow(), i)
        }
    }

    @TestCase
    func test_forward_iterator(): Unit {
        let linkedlist = LinkedList<Int64>(52, {x => x})
        let linkedlist001 = LinkedList<Int64>(52, {x => x})
        linkedlist.reverse()
        let tail_forward = linkedlist.backward(linkedlist.lastNode.getOrThrow())
        var itor001 = linkedlist001.iterator()
        var index = 0
        while (index < 52) {
            let x = itor001.next().getOrThrow()
            let y = tail_forward.next().getOrThrow()
            @Expect(x, y)
            index++
        }
    }

    @TestCase
    func test_forward_nodeAt(): Unit {
        let linkedlist = LinkedList<Int64>(52, {x => x})
        let tail_forward = linkedlist.backward(linkedlist.lastNode.getOrThrow())
        for (i in 51..-1 : -1) {
            let x = tail_forward.next()
            let y = linkedlist.nodeAt(i).getOrThrow().value
            @Expect(x.getOrThrow(), y)
        }
    }

    @TestCase
    func test_forward_exception1(): Unit {
        let linkedlist = LinkedList<Int64>(3, {x => x})
        let node = linkedlist.nodeAt(2).getOrThrow()
        linkedlist.removeLast()
        var flag = false
        try {
            let node_forward = linkedlist.backward(node)
        } catch (e: IllegalStateException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_forward_exception2(): Unit {
        let linkedlist = LinkedList<Int64>(1, {x => x})
        let node_forward = linkedlist.backward(linkedlist.nodeAt(0).getOrThrow())
        linkedlist.removeLast()
        var flag = false
        try {
            node_forward.next()
        } catch (e: ConcurrentModificationException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
