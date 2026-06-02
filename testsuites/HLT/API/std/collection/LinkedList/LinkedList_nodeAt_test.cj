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
 * Test description: Test the LinkedList.nodeAt()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_nodeAt_test {
    @TestCase
    func test_nodeAt(): Unit {
        let linkedlist = LinkedList<Int64>(100, {x => x})
        let node1 = linkedlist.nodeAt(0).getOrThrow()
        let node2 = linkedlist.nodeAt(50).getOrThrow()
        let node3 = linkedlist.nodeAt(99).getOrThrow()
        let node4 = linkedlist.nodeAt(100)
        let node5 = linkedlist.nodeAt(-7)
        @Expect(node1.value, 0)
        @Expect(node2.value, 50)
        @Expect(node3.value, 99)
        @Expect(node4.isNone(), true)
        @Expect(node5.isNone(), true)
    }
}
