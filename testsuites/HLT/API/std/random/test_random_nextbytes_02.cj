/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.random.*
import std.math.*

@Test
class Test_random_nextbytes_02 {
    @TestCase
    func test_random_nextbytes_01(): Unit {
        let r1 = Random(10)
        let r2 = Random(10)
        var arr1: Array<Byte> = [1, 10, 12, 16, 17, 18, 19, 21]
        r1.nextBytes(arr1)
        let arr2 = r2.nextBytes(8)
        @Expect(arr1, arr2)
    }

    @TestCase
    func test_random_nextbytes_02(): Unit {
        let rand = Random()
        let arr = rand.nextBytes(1000)
        @Expect(arr.size, 1000)
    }

    @TestCase
    func test_random_nextbytes_03(): Unit {
        let r1 = Random(100)
        let r2 = Random(100)
        let arr1 = r1.nextBytes(20)
        let arr2 = r2.nextBytes(20)
        @Expect(arr1, arr2)
        r1.nextBytes(arr1)
        r2.nextBytes(arr2)
        @Expect(arr1, arr2)
    }
}
