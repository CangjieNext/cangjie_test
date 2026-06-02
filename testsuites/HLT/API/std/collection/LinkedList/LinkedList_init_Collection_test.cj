/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the LinkedList.init(elements: Collection<T>)
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_init_Collection_test {
    @TestCase
    func test__init_Collection_empty(): Unit {
        // 空
        let c1 = ArrayList<Int64>()
        let linkedlist001 = LinkedList<Int64>(c1)
        @Expect(linkedlist001.size, 0)
    }

    @TestCase
    func test__init_Collection_ArrayList(): Unit {
        // ArrayList
        let c2 = ArrayList<String>(["he", "llo", " ", "wo", "r", "ld", "!"])
        let linkedlist002 = LinkedList<String>(c2)
        // 长度相同
        @Expect(linkedlist002.size, 7)
        // 顺序相同
        for (i in 0..7) {
            let value1 = linkedlist002.nodeAt(i).getOrThrow().value
            let value2 = c2.get(i).getOrThrow()
            @Expect(value1, value2)
        }
    }

    @TestCase
    func test__init_Collection_HashSet(): Unit {
        // HashSet
        let c3 = HashSet<Rune>([r'H', r'u', r'a', r'W', r'e', r'i'])
        let linkedlist003 = LinkedList<Rune>(c3)
        // 长度相同
        @Expect(linkedlist003.size, 6)
        // 迭代顺序相同
        var i = 0
        for (value2 in c3) {
            let value1 = linkedlist003.nodeAt(i).getOrThrow().value
            i++
            @Expect(value1, value2)
        }
    }
}
