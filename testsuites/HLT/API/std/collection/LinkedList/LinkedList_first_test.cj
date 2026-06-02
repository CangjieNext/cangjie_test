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
 * Test description: Test the LinkedList.first
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_first_test {
    @TestCase
    func test_first(): Unit {
        let linkedlist1: LinkedList<Int64> = LinkedList<Int64>()
        let linkedlist2: LinkedList<String> = LinkedList<String>(["just_test"])
        let linkedlist3: LinkedList<Int64> = LinkedList<Int64>(5, {x => x})
        @Expect(linkedlist1.first, None)
        @Expect(linkedlist2.first, Some("just_test"))
        @Expect(linkedlist3.first, Some(0))
    }
}
