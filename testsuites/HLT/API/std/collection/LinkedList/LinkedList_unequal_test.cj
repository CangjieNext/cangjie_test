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
 * Test description: Test the LinkedList !=
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_unequal_test {
    @TestCase
    func test_unequal(): Unit {
        var linkedlist1: LinkedList<String> = LinkedList<String>(["Hua", "Wei", "yao", "yao", "ling", "xian"])
        var linkedlist2: LinkedList<String> = LinkedList<String>(["Hua", "Wei", "yao", "yao", "ling", "xian"])
        var linkedlist3: LinkedList<String> = LinkedList<String>(["Huaaa", "Wei", "yao", "yao", "ling", "xian"])
        var linkedlist4: LinkedList<String> = LinkedList<String>(["Hua", "Wei", "yao", "yao", "ling", "xiannn"])
        var linkedlist5: LinkedList<String> = LinkedList<String>(["Hua", "Wei", "yaoyao", "yao", "ling", "xian"])
        var linkedlist6: LinkedList<String> = LinkedList<String>(["Hua", "Wei", "yao", "yao", "ling"])
        var linkedlist7: LinkedList<String> = LinkedList<String>(["just_test"])
        var bool1 = linkedlist1 != linkedlist2
        var bool2 = linkedlist1 != linkedlist3
        var bool3 = linkedlist1 != linkedlist4
        var bool4 = linkedlist1 != linkedlist5
        var bool5 = linkedlist1 != linkedlist6
        var bool6 = linkedlist1 != linkedlist7
        @Expect(bool1, false)
        @Expect(bool2, true)
        @Expect(bool3, true)
        @Expect(bool4, true)
        @Expect(bool5, true)
        @Expect(bool6, true)
    }
}
