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
 * Test description: Test the LinkedList.remove()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_remove_test {
    @TestCase
    func test_remove_head(): Unit {
        let linkedlist = LinkedList<String>(["yao", "yao_", "ling", "xian"])
        let node = linkedlist.firstNode.getOrThrow()
        let node_value = linkedlist.remove(node)
        @Expect(linkedlist.size, 3)
        @Expect(node_value, "yao")
        let head_after_remove = linkedlist.firstNode.getOrThrow()
        @Expect(head_after_remove.value, "yao_")
    }

    @TestCase
    func test_remove_mid(): Unit {
        let linkedlist = LinkedList<Int64>([1, 2, 3, 4, 5, 6, 7])
        let node = linkedlist.nodeAt(3).getOrThrow()
        let node_value = linkedlist.remove(node)
        @Expect(linkedlist.size, 6)
        @Expect(node_value, 4)
        let node2 = linkedlist.nodeAt(3).getOrThrow()
        @Expect(node2.value, 5)
    }

    @TestCase
    func test_remove_tail(): Unit {
        let linkedlist = LinkedList<String>(["yao", "yao_", "ling", "xian"])
        let node = linkedlist.lastNode.getOrThrow()
        let node_value = linkedlist.remove(node)
        @Expect(linkedlist.size, 3)
        @Expect(node_value, "xian")
        let tail_after_remove = linkedlist.lastNode.getOrThrow()
        @Expect(tail_after_remove.value, "ling")
    }

    @TestCase
    func test_remove_notInList(): Unit {
        var flag = false
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let other_linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = other_linkedlist.firstNode.getOrThrow()
        try {
            let node_value = linkedlist.remove(node)
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_remove_afterRemove(): Unit {
        var flag = 0
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = linkedlist.nodeAt(5).getOrThrow()
        let node_value = linkedlist.remove(node)
        try {
            linkedlist.remove(node)
        } catch (e: IllegalArgumentException) {
            println("remove after remove : IllegalArgumentException")
            flag++
        }
        try {
            linkedlist.addBefore(node, "just_test")
        } catch (e: IllegalArgumentException) {
            println("insertBefore after remove : IllegalArgumentException")
            flag++
        }
        try {
            linkedlist.addAfter(node, "just_test")
        } catch (e: IllegalArgumentException) {
            println("insertAfter after remove : IllegalArgumentException")
            flag++
        }
        try {
            linkedlist.splitOff(node)
        } catch (e: IllegalArgumentException) {
            println("splitOff after remove : IllegalArgumentException")
            flag++
        }
        @Expect(flag, 4)
    }
}
