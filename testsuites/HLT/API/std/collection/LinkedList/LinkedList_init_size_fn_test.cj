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
 * Test description: Test the LinkedList.init(size: Inte64, fn: (index: Int64)->T)
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
class LinkedList_init_size_fn_test {
    public func PreData(a: Int64): Int64 {
        let x: Int64 = a ** 2
        return x
    }

    @TestCase
    func test_init_size_fn_exception(): Unit {
        var flag = false
        try {
            let linkedlist = LinkedList<String>(-7, {x: Int64 => x.toString()})
        } catch (e: IllegalArgumentException) {
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_init_size_fn_0(): Unit {
        let linkedlist = LinkedList<Int64>(0, PreData)
        @Expect(linkedlist.size, 0)
        @Expect(linkedlist.isEmpty(), true)
        @Expect(linkedlist.toString(), "[]")
    }

    @TestCase
    func test_init_size_fn_5(): Unit {
        let linkedlist = LinkedList<Int64>(9, PreData)
        @Expect(linkedlist.size, 9)
        @Expect(linkedlist.isEmpty(), false)
        // 验证是否符合函数规则
        var i = 0
        for (node_value in linkedlist) {
            @Expect(node_value, i ** 2)
            i++
        }
    }
}
