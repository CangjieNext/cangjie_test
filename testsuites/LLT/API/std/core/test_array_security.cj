/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.core.*

@Test
class ArraySecurityTest {
    
    @TestCase
    func test_concat_normal() {
        let arr1 = [1, 2, 3]
        let arr2 = [4, 5, 6]
        let result = arr1.concat(arr2)
        @Expect(result.size, 6)
        @Expect(result[0], 1)
        @Expect(result[5], 6)
    }
    
    @TestCase
    func test_concat_empty() {
        let arr1 = [1, 2, 3]
        let arr2 = Array<Int64>(0, repeat: 0)
        let result = arr1.concat(arr2)
        @Expect(result.size, 3)
        
        let result2 = arr2.concat(arr1)
        @Expect(result2.size, 3)
    }
    
    @TestCase
    func test_repeat_normal() {
        let arr = [1, 2]
        let result = arr.repeat(3)
        @Expect(result.size, 6)
        @Expect(result[0], 1)
        @Expect(result[1], 2)
        @Expect(result[2], 1)
        @Expect(result[3], 2)
        @Expect(result[4], 1)
        @Expect(result[5], 2)
    }
    
    @TestCase
    func test_repeat_zero() {
        let arr = [1, 2, 3]
        var caught = false
        try {
            let result = arr.repeat(0)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught, true)
    }
    
    @TestCase
    func test_repeat_one() {
        let arr = [1, 2, 3]
        let result = arr.repeat(1)
        @Expect(result.size, 3)
        @Expect(result, arr)
    }
    
    @TestCase
    func test_intersperse_normal() {
        let arr = [1, 2, 3]
        let result = arr.intersperse(0)
        @Expect(result.size, 5)
        @Expect(result[0], 1)
        @Expect(result[1], 0)
        @Expect(result[2], 2)
        @Expect(result[3], 0)
        @Expect(result[4], 3)
    }
    
    @TestCase
    func test_intersperse_single() {
        let arr = [1]
        let result = arr.intersperse(0)
        @Expect(result.size, 1)
        @Expect(result[0], 1)
    }
    
    @TestCase
    func test_intersperse_empty() {
        let arr = Array<Int64>(0, repeat: 0)
        let result = arr.intersperse(0)
        @Expect(result.size, 0)
    }
    
    @TestCase
    func test_flatten_normal() {
        let arr: Array<Array<Int64>> = [[1, 2], [3, 4], [5, 6]]
        let result = arr.flatten()
        @Expect(result.size, 6)
        @Expect(result[0], 1)
        @Expect(result[5], 6)
    }
    
    @TestCase
    func test_flatten_empty_inner() {
        let arr: Array<Array<Int64>> = [[], [1, 2], []]
        let result = arr.flatten()
        @Expect(result.size, 2)
        @Expect(result[0], 1)
        @Expect(result[1], 2)
    }
    
    @TestCase
    func test_flatten_empty_outer() {
        let arr: Array<Array<Int64>> = []
        let result = arr.flatten()
        @Expect(result.size, 0)
    }
}
