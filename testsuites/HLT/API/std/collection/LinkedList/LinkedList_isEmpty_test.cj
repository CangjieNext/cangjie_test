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
 * Test description: Test the LinkedList.isEmpty()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_isEmpty_test {
    public func PreData(a: Int64): Int64 {
        let x: Int64 = a ** 2
        return x
    }

    @TestCase
    func test_isEmpty(): Unit {
        let l0 = LinkedList<String>()
        @Expect(l0.isEmpty(), true)
        let l1 = LinkedList<Int64>([0, 1, 2, 3, 4, 5])
        @Expect(l1.isEmpty(), false)
        let l2 = LinkedList<String>(3, {x: Int64 => x.toString()})
        @Expect(l2.isEmpty(), false)
        let l3 = LinkedList<Int64>(3, PreData)
        @Expect(l3.isEmpty(), false)
        let l4 = ArrayList<String>(["he", "llo", " ", "wo", "r", "ld", "!"])
        let l5 = LinkedList<String>(l4)
        @Expect(l5.isEmpty(), false)
    }
}
