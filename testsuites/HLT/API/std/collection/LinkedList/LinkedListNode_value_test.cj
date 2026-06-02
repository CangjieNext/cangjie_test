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
 * Test description: Test the LinkedListNode.value
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedListNode_value_test {
    @TestCase
    func test_value(): Unit {
        let linkedlist1: LinkedList<Int64> = LinkedList<Int64>([1024])
        let linkedlist2: LinkedList<String> = LinkedList<String>(["just_test"])
        let value1 = linkedlist1.firstNode.getOrThrow().value
        let value2 = linkedlist2.firstNode.getOrThrow().value
        @Expect(value1, 1024)
        @Expect(value2, "just_test")
    }

    @TestCase
    func test_value_modify(): Unit {
        let linkedlist: LinkedList<String> = LinkedList<String>(["just_test"])
        let node = linkedlist.firstNode.getOrThrow()
        node.value = "just_test yao yao ling xian!"
        let value = linkedlist.firstNode.getOrThrow().value
        @Expect(value, "just_test yao yao ling xian!")
    }

    @TestCase
    func test_value_expection(): Unit {
        let linkedlist: LinkedList<String> = LinkedList<String>(["just_test", "yao", "yao", "ling", "xian"])
        let node = linkedlist.firstNode.getOrThrow()
        linkedlist.remove(node)
        var flag = false
        try {
            node.value = "dazui"
        } catch (e: IllegalStateException) {
            flag = true
        }
        @Expect(flag, true)
    }
}
