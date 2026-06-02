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
 * Test description: Test the LinkedList.iterator()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_iterator_test {
    @TestCase
    func test_iterator_nodeAt(): Unit {
        let linkedlist = LinkedList<Int64>(18, {x => x})
        var itor001 = linkedlist.iterator()
        var x = itor001.next()
        var index = 0;
        while (index < 18) {
            var y = linkedlist.nodeAt(index).getOrThrow().value
            @Expect(x.getOrThrow(), y)
            x = itor001.next()
            index++
        }
    }

    @TestCase
    func test_iterator_LinkedListNode_next(): Unit {
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
    func test_iterator_LinkedListNode_backward(): Unit {
        let linkedlist = LinkedList<Int64>(26, {x => x})
        let head_backward = linkedlist.forward(linkedlist.firstNode.getOrThrow())
        var itor001 = linkedlist.iterator()
        var index = 0
        while (index < 26) {
            let x = itor001.next()
            let y = head_backward.next()
            @Expect(x.getOrThrow(), y.getOrThrow())
            index++
        }
    }

    @TestCase
    func test_iterator_LinkedListNode_forward(): Unit {
        var linkedlist = LinkedList<Int64>(26, {x => x})
        var linkedlist2 = LinkedList<Int64>(26, {x => x})
        var itor001 = linkedlist.iterator()
        linkedlist2.reverse()
        let head_forward = linkedlist2.backward(linkedlist2.lastNode.getOrThrow())
        var index = 0
        while (index < 26) {
            let x = itor001.next()
            let y = head_forward.next()
            @Expect(x.getOrThrow(), y.getOrThrow())
            index++
        }
    }

    @TestCase
    func test_iterator_modify_node_value(): Unit {
        var linkedlist = LinkedList<Int64>(35, {x => x})
        var flag = false
        var changed = 0
        for (value in linkedlist) {
            if (!flag) {
                linkedlist.nodeAt(30).getOrThrow().value = 999
                flag = true
            }
            if (value == 999) {
                changed++
            }
        }
        @Expect(changed, 1)
    }

    @TestCase
    func test_iterator_Exception(): Unit {
        var linkedlist = LinkedList<Int64>(100, {x => x})
        var itor001 = linkedlist.iterator()
        let node = linkedlist.firstNode.getOrThrow()
        let x = linkedlist.addBefore(node, 100)
        var excep = 0
        try {
            itor001.next()
        } catch (e: ConcurrentModificationException) {
            excep++
        }
        try {
            for (value in linkedlist) {
                linkedlist.reverse()
            }
        } catch (e: ConcurrentModificationException) {
            excep++
        }
        @Expect(excep, 2)
    }
}
