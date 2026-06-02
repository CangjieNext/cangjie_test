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
 * Test description: Test the LinkedList.splitOff()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_splitOff_test {
    @TestCase
    func test_splitOff_1_head(): Unit {
        let linkedlist = LinkedList<String>(["just_test"])
        let old_linkedlist = LinkedList<String>(["just_test"])
        let head = old_linkedlist.firstNode.getOrThrow()
        let new_linkedlist = old_linkedlist.splitOff(head)
        let isEqual = linkedlist == new_linkedlist
        @Expect(old_linkedlist.size, 0)
        @Expect(old_linkedlist.isEmpty(), true)
        @Expect(new_linkedlist.size, 1)
        @Expect(new_linkedlist.isEmpty(), false)
        @Expect(isEqual, true)
    }

    @TestCase
    func test_splitOff_1_tail(): Unit {
        let linkedlist = LinkedList<String>(["just_test"])
        let old_linkedlist = LinkedList<String>(["just_test"])
        let tail = old_linkedlist.lastNode.getOrThrow()
        let new_linkedlist = old_linkedlist.splitOff(tail)
        let isEqual = linkedlist == new_linkedlist
        @Expect(old_linkedlist.size, 0)
        @Expect(old_linkedlist.isEmpty(), true)
        @Expect(new_linkedlist.size, 1)
        @Expect(new_linkedlist.isEmpty(), false)
        @Expect(isEqual, true)
    }

    @TestCase
    func test_splitOff_9_head(): Unit {
        let linkedlist = LinkedList<Int64>(9, {x => x})
        let old_linkedlist = LinkedList<Int64>(9, {x => x})
        let head = old_linkedlist.firstNode.getOrThrow()
        let new_linkedlist = old_linkedlist.splitOff(head)
        let isEqual = linkedlist == new_linkedlist
        @Expect(old_linkedlist.size, 0)
        @Expect(old_linkedlist.isEmpty(), true)
        @Expect(new_linkedlist.size, 9)
        @Expect(new_linkedlist.isEmpty(), false)
        @Expect(isEqual, true)
    }

    @TestCase
    func test_splitOff_17_tail(): Unit {
        let linkedlist = LinkedList<Int64>(17, {x => x})
        let old_linkedlist = LinkedList<Int64>(17, {x => x})
        let tail = old_linkedlist.lastNode.getOrThrow()
        let new_linkedlist = old_linkedlist.splitOff(tail)
        linkedlist.removeLast()
        let isEqual = linkedlist == new_linkedlist
        @Expect(old_linkedlist.size, 16)
        @Expect(old_linkedlist.isEmpty(), false)
        @Expect(new_linkedlist.size, 1)
        @Expect(new_linkedlist.isEmpty(), false)
        @Expect(isEqual, false)
    }

    @TestCase
    func test_splitOff_18_11(): Unit {
        let old_linkedlist = LinkedList<Int64>(18, {x => x})
        let node = old_linkedlist.nodeAt(10).getOrThrow()
        let new_linkedlist = old_linkedlist.splitOff(node)
        @Expect(old_linkedlist.size, 10)
        @Expect(old_linkedlist.isEmpty(), false)
        @Expect(new_linkedlist.size, 8)
        @Expect(new_linkedlist.isEmpty(), false)
    }

    @TestCase
    func test_splitOff_5_notIn(): Unit {
        let linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let other_linkedlist = LinkedList<String>(9, {x: Int64 => x.toString()})
        let node = other_linkedlist.firstNode.getOrThrow()
        var flag = false
        try {
            linkedlist.splitOff(node)
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_splitOff_7_afterRemove(): Unit {
        let linkedlist = LinkedList<String>(7, {x: Int64 => x.toString()})
        let node = linkedlist.nodeAt(3).getOrThrow()
        linkedlist.remove(node)
        var flag = false
        try {
            linkedlist.splitOff(node)
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
