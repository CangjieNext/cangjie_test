/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 
import std.core.*

@Test
class Test_indexOf {
    @TestCase
    func indexOf_case01(): Unit {
        let num_array: Array<Int8> = [1, 2, 3, 4, 5]
        @Expect(num_array.indexOf(2), 1)
        @Expect(num_array.indexOf(0), None)
        @Expect(num_array.indexOf(3, 3), None)
        @Expect(num_array.indexOf(3, 2), 2)
        @Expect(num_array.indexOf(3, -1), 2)
        @Expect(num_array.indexOf(5, 5), None)
        @Expect(num_array.indexOf(3, 999), None)
        @Expect(num_array.lastIndexOf(3), 2)
        @Expect(num_array.lastIndexOf(3, -1), 2)
        @Expect(num_array.lastIndexOf(3, 3), None)
        @Expect(num_array.lastIndexOf(5, 5), None)
    }

    @TestCase
    func indexOf_case03(): Unit {
        let num_array: Array<Float64> = [1.0, 2.0, 3.0, 4.0, 5.0]
        @Expect(num_array.indexOf(1.0), 0)
        @Expect(num_array.indexOf(0.0), None)
        @Expect(num_array.indexOf(3.0, 3), None)
        @Expect(num_array.indexOf(3.0, 2), 2)
        @Expect(num_array.indexOf(3.0, -1), 2)
        @Expect(num_array.indexOf(3.0, 999), None)
        @Expect(num_array.lastIndexOf(3.0), 2)
        @Expect(num_array.lastIndexOf(3.0, 2), 2)
        @Expect(num_array.lastIndexOf(3.0, 4), None)
    }

    @TestCase
    func indexOf_case04(): Unit {
        let num_array: Array<String> = ["cang", "jie", "!"]
        @Expect(num_array.indexOf("!"), 2)
        @Expect(num_array.lastIndexOf("cang", 0), 0)
        @Expect(num_array.lastIndexOf(" "), None)
    }

    @TestCase
    func indexOf_case05(): Unit {
        let num_array: Array<Bool> = [true, false, true, false, true]
        @Expect(num_array.indexOf(true), 0)
        @Expect(num_array.indexOf(false), 1)
        @Expect(num_array.lastIndexOf(true, 0), 4)
    }

    @TestCase
    func indexOf_case06(): Unit {
        let num_array: Array<Int8> = [0, 1, 2, 3, 1, 2, 3, 4, 5, 6]
        let sub_array: Array<Int8> = [1, 2, 3]
        let not_array: Array<Int8> = [5, 4, 3]
        @Expect(num_array.indexOf(sub_array), 1)
        @Expect(num_array.indexOf(not_array), None)
        @Expect(num_array.indexOf(sub_array, 4), 4)
        @Expect(num_array.indexOf(sub_array, -0), 1)
        @Expect(num_array.indexOf(sub_array, 5), None)
        @Expect(num_array.indexOf(sub_array, 10), None)
        @Expect(num_array.lastIndexOf(sub_array, 0), 4)
        @Expect(num_array.lastIndexOf(not_array, 0), None)
    }

    @TestCase
    func indexOf_case07(): Unit {
        let num_array: Array<Bool> = [true, false, true, false, true]
        let sub_array: Array<Bool> = [true]
        @Expect(num_array.indexOf(sub_array), 0)
        @Expect(num_array.indexOf(sub_array, 4), 4)
        @Expect(num_array.indexOf(sub_array, -0), 0)
        @Expect(num_array.indexOf(sub_array, 5), None)
        @Expect(num_array.indexOf(sub_array, 10), None)
        @Expect(num_array.lastIndexOf(sub_array, 0), 4)
    }
}
