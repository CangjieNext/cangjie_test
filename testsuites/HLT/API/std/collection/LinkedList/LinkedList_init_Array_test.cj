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
 * Test description: Test the LinkedList.init(elements: Array<T>)
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_init_Array_test {
    @TestCase
    func test_init_Array_empty(): Unit {
        let arr1: Array<Rune> = []
        let l1 = LinkedList<Rune>(arr1)
        @Expect(l1.size, 0)
        @Expect(l1.isEmpty(), true)
        @Expect(l1.toString(), "[]")
    }

    @TestCase
    func test_init_Array_8(): Unit {
        let arr2 = ["yao", "yao", "ling", "xian", "yao", "yao", "ling", "xian"]
        let l2 = LinkedList<String>(arr2)
        @Expect(l2.size, 8)
        @Expect(l2.isEmpty(), false)
        // 顺序相同
        for (i in 0..8) {
            let value1 = l2.nodeAt(i).getOrThrow().value
            let value2 = arr2.get(i).getOrThrow()
            @Expect(value1, value2)
        }
    }

    @TestCase
    func test_init_Array_15(): Unit {
        let arr3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
        let l3 = LinkedList<Int64>(arr3)
        @Expect(l3.size, 15)
        @Expect(l3.isEmpty(), false)
        // 顺序相同
        for (i in 0..8) {
            let value1 = l3.nodeAt(i).getOrThrow().value
            let value2 = arr3.get(i).getOrThrow()
            @Expect(value1, value2)
        }
    }
}
