/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 0, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 4

import std.unittest.RelativeDelta

@Test
class Test_Float16 {

    @TestCase
    func simpleLess(): Unit {
        @PowerAssert(1.3f16 <= 1.1f16, delta: 0.1f16)
    }

/* SCAN-IN
Assert Failed: `((1.3f16) <= (1.1f16) with delta: 0.1f16 )`
*/

    @TestCase
    func complexLess(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @PowerAssert(3.1f16 + b * (c - a) - 2.0f16 <= 1.3f16 * (a + a + b - c * a), delta: 0.1f16 + c * a)
    }

/* SCAN-IN
Assert Failed: `((3.1f16 + b * (c - a) - 2.0f16) <= (1.3f16 * (a + a + b - c * a)) with delta: 0.1f16 + c * a )`
                     |        |_|  | | |_||        |    |         |_| | | | | |_| | ||            |        |_| | |
                     |      0.300049 0.002001      |    |       0.002001| | 3.109375||            |      3.109375|
                     |        |    |_|   ||        |    |         |   |_| | | |   |_||            |        |   |_|
                     |        |  3.109375||        |    |         | 0.002001| | 0.002001          |        | 0.002001
                     |        |    |_____||        |    |         |_____| | | |_____||            |        |_____|
                     |        |    3.107422        |    |         0.004002| | 0.006222            |        0.006222
                     |        |___________|        |    |         |       |_|       ||            |______________|
                     |           0.932617 |        |    |         |     0.300049    ||                0.106201
                     |____________________|        |    |         |_________|       ||
                     |      4.031250               |    |         | 0.303955        ||
                     |_____________________________|    |         |_________________||
                                 2.031250               |               0.297852     |
                                                        |____________________________|
                                                                   0.387207
*/

   @TestCase
    func simpleRelative(): Unit {
        @PowerAssert(1.3f16 <= 1.1f16, delta: RelativeDelta(absolute: 0.11f16, relative: 0.001))
    }

/* SCAN-IN
Assert Failed: `((1.3f16) <= (1.1f16) with delta: RelativeDelta(absolute: 0.11f16, relative: 0.001) )`
*/

    @TestCase
    func complexRelative(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @PowerAssert(3.1f16 + b * (c - a) - 2.0f16 <= 1.3f16 * (a + a + b - c * a), 
            delta: RelativeDelta(absolute: 0.35f16 + c * a, relative: 0.0003f16 + 0.1f16))
    }

/* SCAN-IN
Assert Failed: `((3.1f16 + b * (c - a) - 2.0f16) <= (1.3f16 * (a + a + b - c * a)) with delta: RelativeDelta(absolute: 0.35f16 + c * a, relative: 0.0003f16 + 0.1f16) )`
                     |        |_|  | | |_||        |    |         |_| | | | | |_| | ||                                    |         |_| | |          |__________________|
                     |      0.300049 0.002001      |    |       0.002001| | 3.109375||                                    |       3.109375|                0.100281
                     |        |    |_|   ||        |    |         |   |_| | | |   |_||                                    |         |   |_|
                     |        |  3.109375||        |    |         | 0.002001| | 0.002001                                  |         | 0.002001
                     |        |    |_____||        |    |         |_____| | | |_____||                                    |         |_____|
                     |        |    3.107422        |    |         0.004002| | 0.006222                                    |         0.006222
                     |        |___________|        |    |         |       |_|       ||                                    |_______________|
                     |           0.932617 |        |    |         |     0.300049    ||                                         0.356201
                     |____________________|        |    |         |_________|       ||
                     |      4.031250               |    |         | 0.303955        ||
                     |_____________________________|    |         |_________________||
                                 2.031250               |               0.297852     |
                                                        |____________________________|
                                                                   0.387207
*/
}
