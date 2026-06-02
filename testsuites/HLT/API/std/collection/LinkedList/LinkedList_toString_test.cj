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
 * Test description: Test the LinkedList.toString()
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.math.*

@Test
class LinkedList_toString_test {
    @TestCase
    func test_toString_empty(): Unit {
        let linkedlist = LinkedList<Float64>()
        @Expect(linkedlist.toString(), "[]")
    }

    @TestCase
    func test_toString_String(): Unit {
        let linkedlist = LinkedList<String>(["hua", "zi"])
        @Expect(linkedlist.toString(), "[hua, zi]")
    }

    @TestCase
    func test_toString_Bool(): Unit {
        let linkedlist = LinkedList<Bool>([true, false, true])
        @Expect(linkedlist.toString(), "[true, false, true]")
    }

    @TestCase
    func test_toString_Char(): Unit {
        let linkedlist = LinkedList<Rune>([r'H', r'u', r'a', r'W', r'e', r'i'])
        @Expect(linkedlist.toString(), "[H, u, a, W, e, i]")
    }

    @TestCase
    func test_toString_Int(): Unit {
        let linkedlist = LinkedList<Int64>(7, {x => x})
        @Expect(linkedlist.toString(), "[0, 1, 2, 3, 4, 5, 6]")
    }

    @TestCase
    func test_toString_Float(): Unit {
        let linkedlist = LinkedList<Float64>([3.1415926, 3.1415927, 2.718281828, 1.414, 1.732, 2.236])
        @Expect(linkedlist.toString(), "[3.141593, 3.141593, 2.718282, 1.414000, 1.732000, 2.236000]")
    }

    @TestCase
    func test_toString_MAX_MIN(): Unit {
        var linkedlist1: LinkedList<String> = LinkedList<String>(["Hua", "Wei"])
        var linkedlist2: LinkedList<Bool> = LinkedList<Bool>([true, false])
        var linkedlist3: LinkedList<Int8> = LinkedList<Int8>([Int8.Max, Int8.Min])
        var linkedlist4: LinkedList<Int32> = LinkedList<Int32>([Int32.Max, Int32.Min])
        var linkedlist5: LinkedList<UInt8> = LinkedList<UInt8>([UInt8.Max, UInt8.Min])
        var linkedlist6: LinkedList<Float16> = LinkedList<Float16>([Float16.Max, Float16.Min])
        var linkedlist7: LinkedList<Float32> = LinkedList<Float32>([Float32.Max, Float32.Min])
        var linkedlist8: LinkedList<Rune> = LinkedList<Rune>([r'H', r'w'])
        var linkedlist9: LinkedList<Int64> = LinkedList<Int64>([Int64.Max, Int64.Min])
        var linkedlist11: LinkedList<Int16> = LinkedList<Int16>([Int16.Max, Int16.Min])
        var linkedlist12: LinkedList<UInt16> = LinkedList<UInt16>([UInt16.Max, UInt16.Min])
        var linkedlist13: LinkedList<UInt32> = LinkedList<UInt32>([UInt32.Max, UInt32.Min])
        var linkedlist14: LinkedList<UInt64> = LinkedList<UInt64>([UInt64.Max, UInt64.Min])
        var linkedlist15: LinkedList<Float64> = LinkedList<Float64>([Float64.Max, Float64.Min])

        var str1: Array<String> = [linkedlist1.toString(), linkedlist2.toString(), linkedlist3.toString(),
            linkedlist4.toString(), linkedlist5.toString(), linkedlist6.toString(), linkedlist7.toString(),
            linkedlist8.toString(), linkedlist9.toString(), linkedlist11.toString(), linkedlist12.toString(),
            linkedlist13.toString(), linkedlist14.toString(), linkedlist15.toString()]
        var exp_str: Array<String> = [
            "[Hua, Wei]",
            "[true, false]",
            "[${Int8.Max}, ${Int8.Min}]",
            "[${Int32.Max}, ${Int32.Min}]",
            "[${UInt8.Max}, ${UInt8.Min}]",
            "[${Float16.Max}, ${Float16.Min}]",
            "[${Float32.Max}, ${Float32.Min}]",
            "[H, w]",
            "[${Int64.Max}, ${Int64.Min}]",
            "[${Int16.Max}, ${Int16.Min}]",
            "[${UInt16.Max}, ${UInt16.Min}]",
            "[${UInt32.Max}, ${UInt32.Min}]",
            "[${UInt64.Max}, ${UInt64.Min}]",
            "[${Float64.Max}, ${Float64.Min}]"
        ]
        var pass = true
        for (i in 0..str1.size) {
            if (str1[i] != exp_str[i]) {
                println("i=" + i.toString())
                println("str1[i]=" + str1[i])
                println("exp_str[i]=" + exp_str[i])
                pass = false
            }
        }
        @Expect(pass, true)
    }
}
