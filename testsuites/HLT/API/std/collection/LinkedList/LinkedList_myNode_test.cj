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
 * Test description: Test the LinkedList 自定义类型
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

class MyNode {
    var value: Int64 = 0

    public init(value: Int64) {
        this.value = value
    }

    func f(): Int64 {
        return 100
    }
}

extend MyNode <: ToString {
    public func toString(): String {
        return this.value.toString()
    }
}

@Test
class LinkedList_myNode_test {
    @TestCase
    func test_MyNode_init(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        @Expect(linkedlist.size, 3)

        // first firstNode
        let first_value = linkedlist.first.getOrThrow().value
        @Expect(first_value, 1)
        let first_f = linkedlist.first.getOrThrow().f()
        @Expect(first_f, 100)
        let first_toString = linkedlist.first.getOrThrow().toString()
        @Expect(first_toString, "1")
        let last_value = linkedlist.last.getOrThrow().value
        @Expect(last_value, 3)
        let last_f = linkedlist.last.getOrThrow().f()
        @Expect(last_f, 100)
        let last_toString = linkedlist.last.getOrThrow().toString()
        @Expect(last_toString, "3")

        // last lastNode
        let first_value2 = linkedlist.firstNode.getOrThrow().value.value
        @Expect(first_value2, 1)
        let first_f2 = linkedlist.firstNode.getOrThrow().value.f()
        @Expect(first_f2, 100)
        let first_toString2 = linkedlist.firstNode.getOrThrow().value.toString()
        @Expect(first_toString2, "1")
        let last_value2 = linkedlist.lastNode.getOrThrow().value.value
        @Expect(last_value2, 3)
        let last_f2 = linkedlist.lastNode.getOrThrow().value.f()
        @Expect(last_f2, 100)
        let last_toString2 = linkedlist.lastNode.getOrThrow().value.toString()
        @Expect(last_toString2, "3")
    }

    @TestCase
    func test_MyNode_pend(): Unit {
        let linkedlist = LinkedList<MyNode>()
        linkedlist.addLast(MyNode(1))
        linkedlist.addLast(MyNode(2))
        linkedlist.addLast(MyNode(3))
        @Expect(linkedlist.size, 3)
        let first_value = linkedlist.first.getOrThrow().value
        @Expect(first_value, 1)
        let first_f = linkedlist.first.getOrThrow().f()
        @Expect(first_f, 100)
        let first_toString = linkedlist.first.getOrThrow().toString()
        @Expect(first_toString, "1")

        linkedlist.reverse()

        @Expect(linkedlist.size, 3)
        let first_value_reverse = linkedlist.first.getOrThrow().value
        @Expect(first_value_reverse, 3)
        let first_f_reverse = linkedlist.first.getOrThrow().f()
        @Expect(first_f_reverse, 100)
        let first_toString_reverse = linkedlist.first.getOrThrow().toString()
        @Expect(first_toString_reverse, "3")
    }

    @TestCase
    func test_MyNode_insert(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        let node = linkedlist.nodeAt(1).getOrThrow()
        linkedlist.addBefore(node, MyNode(-1))
        @Expect(linkedlist.size, 4)
        linkedlist.addAfter(node, MyNode(-2))
        @Expect(linkedlist.size, 5)
        let nodeat_1_value: Int64 = linkedlist.nodeAt(1).getOrThrow().value.value
        @Expect(nodeat_1_value, -1)
        let nodeat_2_value: Int64 = linkedlist.nodeAt(2).getOrThrow().value.value
        @Expect(nodeat_2_value, 2)
        let nodeat_3_value: Int64 = linkedlist.nodeAt(3).getOrThrow().value.value
        @Expect(nodeat_3_value, -2)
    }

    @TestCase
    func test_MyNode_remove(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        let node = linkedlist.nodeAt(1).getOrThrow()
        linkedlist.remove(node)
        @Expect(linkedlist.size, 2)
        let nodeat_0 = linkedlist.nodeAt(0).getOrThrow().value
        @Expect(nodeat_0.value, 1)
        let nodeat_1 = linkedlist.nodeAt(1).getOrThrow().value
        @Expect(nodeat_1.value, 3)
    }

    @TestCase
    func test_MyNode_pop_first(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        var index = 1
        while (!linkedlist.isEmpty()) {
            let x = linkedlist.removeFirst().getOrThrow().value
            @Expect(x, index)
            index++
        }
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_MyNode_pop_last(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        for (i in 3..0 : -1) {
            let x = linkedlist.removeLast().getOrThrow().value
            @Expect(x, i)
        }
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_MyNode_clear(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        linkedlist.clear()
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }

    @TestCase
    func test_MyNode_iterator(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        let itor = linkedlist.iterator()
        for (i in 1..4) {
            var x = itor.next().getOrThrow().value
            @Expect(x, i)
        }
    }

    @TestCase
    func test_MyNode_reverse(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        linkedlist.reverse()
        let itor = linkedlist.iterator()
        for (i in 3..0 : -1) {
            var x = itor.next().getOrThrow().value
            @Expect(x, i)
        }
    }

    @TestCase
    func test_MyNode_splitOff(): Unit {
        let linkedlist = LinkedList<MyNode>([MyNode(1), MyNode(2), MyNode(3)])
        let node = linkedlist.nodeAt(1).getOrThrow()
        let new_linkedlist = linkedlist.splitOff(node)
        @Expect(linkedlist.size, 1)
        @Expect(new_linkedlist.size, 2)
        let itor001 = linkedlist.iterator()
        for (i in 1..2) {
            var x = itor001.next().getOrThrow().value
            @Expect(x, i)
        }
        let itor002 = new_linkedlist.iterator()
        for (i in 2..4) {
            var x = itor002.next().getOrThrow().value
            @Expect(x, i)
        }
    }
}
