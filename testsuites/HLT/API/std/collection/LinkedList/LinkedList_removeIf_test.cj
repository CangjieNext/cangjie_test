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
 * Test description: Test the LinkedList.removeIf()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_removeIf_test {
    func predicate(y: Int64): Bool {
        if ((y % 2) == 1) {
            return true
        }
        return false
    }

    func predicate2(y: Int64): Bool {
        if ((y % 2) == 0) {
            return true
        }
        return false
    }

    @TestCase
    func test_remove_head(): Unit {
        let linkedlist = LinkedList<Int64>(100, {x => x})
        // 删除奇数
        linkedlist.removeIf(predicate)
        @Expect(linkedlist.size, 50)
        // 验证是否符合规则
        for (node in linkedlist) {
            let remainder = node % 2
            @Expect(remainder, 0)
        }
        // 抽样验证
        let first_value = linkedlist.first.getOrThrow()
        @Expect(first_value, 0)
        let nodeAt_value = linkedlist.nodeAt(5).getOrThrow().value
        @Expect(nodeAt_value, 10)
        let last_value = linkedlist.last.getOrThrow()
        @Expect(last_value, 98)
        // 再删除偶数
        linkedlist.removeIf(predicate2)
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
    }
}
