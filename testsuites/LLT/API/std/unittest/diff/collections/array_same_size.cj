/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = [1, 2, 3]
        let b = [1, 2, 4]
        @Assert(a, b)
    }

    @TestCase
    func case2(): Unit {
        let a = [1]
        let b = [2]
        @Assert(a, b)
    }

    @TestCase
    func case3(): Unit {
        let a = [1, 2, 3]
        let b = [3, 2, 1]
        @Assert(a, b)
    }

    @TestCase
    func case4(): Unit {
        let a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        let b = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 7, 8, 9, 10, 11,
            12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        let b = [12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 12, 11, 10, 9, 8, 7, 6, 5,
            4, 3, 2, 1, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 6, 5, 4, 3, 2, 1,
            12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [2]: 3 != 4
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: 1 != 2
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: 1 != 3
            [2]: 3 != 1
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: 1 != 12
            [1]: 2 != 11
            [2]: 3 != 10
            [3]: 4 != 9
            [4]: 5 != 8
            [5]: 6 != 7
            [6]: 7 != 6
            [7]: 8 != 5
            [8]: 9 != 4
            [9]: 10 != 3
            [10]: 11 != 2
            [11]: 12 != 1
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: 1 != 12
            [1]: 2 != 11
            [2]: 3 != 10
            [3]: 4 != 9
            [4]: 5 != 8
            [5]: 6 != 7
            [6]: 7 != 6
            [7]: 8 != 5
            [8]: 9 != 4
            [9]: 10 != 3
            [10]: 11 != 2
            [11]: 12 != 1
            [12]: 1 != 12
            [13]: 2 != 11
            [14]: 3 != 10
            [15]: 4 != 9
            [16]: 5 != 8
            [17]: 6 != 7
            [18]: 7 != 6
            [19]: 8 != 5
            ...further 58 different elements are omitted
 */
