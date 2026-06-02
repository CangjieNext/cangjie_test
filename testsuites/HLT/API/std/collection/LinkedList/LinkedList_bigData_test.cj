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
 * Test description: Test the LinkedList 万级数据量测试
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_bigData_test {
    @TestCase
    func test_massive_init(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        @Expect(linkedlist.size, 80000)
        @Expect(linkedlist.first, Some(0))
        @Expect(linkedlist.last, Some(79999))
        @Expect(linkedlist.isEmpty(), false)
        @Expect(linkedlist.nodeAt(66666).getOrThrow().value, 66666)
        @Expect(linkedlist.firstNode.getOrThrow().value, 0)
        @Expect(linkedlist.lastNode.getOrThrow().value, 79999)
    }

    @TestCase
    func test_massive_pend(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        linkedlist.addFirst(-1)
        @Expect(linkedlist.size, 80001)
        @Expect(linkedlist.first, Some(-1))
        linkedlist.addLast(-2)
        @Expect(linkedlist.size, 80002)
        @Expect(linkedlist.last, Some(-2))
    }

    @TestCase
    func test_massive_insert(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        let node = linkedlist.nodeAt(50000).getOrThrow()
        linkedlist.addBefore(node, -1)
        @Expect(linkedlist.size, 80001)
        linkedlist.addAfter(node, -2)
        @Expect(linkedlist.size, 80002)
        @Expect(linkedlist.nodeAt(50000).getOrThrow().value, -1)
        @Expect(linkedlist.nodeAt(50001).getOrThrow().value, 50000)
        @Expect(linkedlist.nodeAt(50002).getOrThrow().value, -2)
    }

    @TestCase
    func test_massive_remove(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        let node = linkedlist.nodeAt(50000).getOrThrow()
        linkedlist.remove(node)
        @Expect(linkedlist.size, 79999)
        @Expect(linkedlist.nodeAt(49999).getOrThrow().value, 49999)
        @Expect(linkedlist.nodeAt(50000).getOrThrow().value, 50001)
    }

    @TestCase
    func test_massive_removeIf(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        func predicate(x: Int64): Bool {
            if (x >= 0) {
                return true
            }
            return false
        }
        linkedlist.removeIf(predicate)
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_massive_pop_first(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        var index = 0
        while (!linkedlist.isEmpty()) {
            let x = linkedlist.removeFirst().getOrThrow()
            @Expect(x, index)
            index++
        }
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_massive_pop_last(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        for (i in 79999..-1 : -1) {
            let x = linkedlist.removeLast().getOrThrow()
            @Expect(x, i)
        }
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_massive_clear(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        linkedlist.clear()
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_massive_iterator(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        let itor = linkedlist.iterator()
        for (i in 0..80000) {
            var x = itor.next().getOrThrow()
            @Expect(x, i)
        }
    }

    @TestCase
    func test_massive_reverse(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        linkedlist.reverse()
        let itor = linkedlist.iterator()
        for (i in 79999..-1 : -1) {
            var x = itor.next().getOrThrow()
            @Expect(x, i)
        }
    }

    @TestCase
    func test_massive_splitOff(): Unit {
        let linkedlist = LinkedList<Int64>(80000, {x => x})
        let node = linkedlist.nodeAt(40000).getOrThrow()
        let new_linkedlist = linkedlist.splitOff(node)
        @Expect(linkedlist.size, 40000)
        @Expect(new_linkedlist.size, 40000)
        let itor001 = linkedlist.iterator()
        for (i in 0..40000) {
            var x = itor001.next().getOrThrow()
            @Expect(x, i)
        }
        let itor002 = new_linkedlist.iterator()
        for (i in 40000..80000) {
            var x = itor002.next().getOrThrow()
            @Expect(x, i)
        }
    }
}
