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
        @PowerAssert(1.3f32 <= 1.1f32, delta: 0.1f32)
    }

/* SCAN-IN
Assert Failed: `((1.3f32) <= (1.1f32) with delta: 0.1f32 )`
*/

    @TestCase
    func complexLess(): Unit {
        let a = 0.002f32
        let b = 0.3f32
        let c = 3.11f32
        @PowerAssert(3.1f32 + b * (c - a) - 2.0f32 <= 1.3f32 * (a + a + b - c * a), delta: 0.1f32 + c * a)
    }

/* SCAN-IN
Assert Failed: `((3.1f32 + b * (c - a) - 2.0f32) <= (1.3f32 * (a + a + b - c * a)) with delta: 0.1f32 + c * a )`
                     |        |_|  | | |_||        |    |         |_| | | | | |_| | ||            |        |_| | |
                     |      0.300000 0.002000      |    |       0.002000| | 3.110000||            |      3.110000|
                     |        |    |_|   ||        |    |         |   |_| | | |   |_||            |        |   |_|
                     |        |  3.110000||        |    |         | 0.002000| | 0.002000          |        | 0.002000
                     |        |    |_____||        |    |         |_____| | | |_____||            |        |_____|
                     |        |    3.108000        |    |         0.004000| | 0.006220            |        0.006220
                     |        |___________|        |    |         |       |_|       ||            |______________|
                     |           0.932400 |        |    |         |     0.300000    ||                0.106220
                     |____________________|        |    |         |_________|       ||
                     |      4.032400               |    |         | 0.304000        ||
                     |_____________________________|    |         |_________________||
                                 2.032400               |               0.297780     |
                                                        |____________________________|
                                                                   0.387114
*/

   @TestCase
    func simpleRelative(): Unit {
        @PowerAssert(1.3f32 <= 1.1f32, delta: RelativeDelta(absolute: 0.11f32, relative: 0.001))
    }

/* SCAN-IN
Assert Failed: `((1.3f32) <= (1.1f32) with delta: RelativeDelta(absolute: 0.11f32, relative: 0.001) )`
*/

    @TestCase
    func complexRelative(): Unit {
        let a = 0.002f32
        let b = 0.3f32
        let c = 3.11f32
        @PowerAssert(3.1f32 + b * (c - a) - 2.0f32 <= 1.3f32 * (a + a + b - c * a), 
            delta: RelativeDelta(absolute: 0.35f32 + c * a, relative: 0.0003f32 + 0.1f32))
    }

/* SCAN-IN
Assert Failed: `((3.1f32 + b * (c - a) - 2.0f32) <= (1.3f32 * (a + a + b - c * a)) with delta: RelativeDelta(absolute: 0.35f32 + c * a, relative: 0.0003f32 + 0.1f32) )`
                     |        |_|  | | |_||        |    |         |_| | | | | |_| | ||                                    |         |_| | |          |__________________|
                     |      0.300000 0.002000      |    |       0.002000| | 3.110000||                                    |       3.110000|                0.100300
                     |        |    |_|   ||        |    |         |   |_| | | |   |_||                                    |         |   |_|
                     |        |  3.110000||        |    |         | 0.002000| | 0.002000                                  |         | 0.002000
                     |        |    |_____||        |    |         |_____| | | |_____||                                    |         |_____|
                     |        |    3.108000        |    |         0.004000| | 0.006220                                    |         0.006220
                     |        |___________|        |    |         |       |_|       ||                                    |_______________|
                     |           0.932400 |        |    |         |     0.300000    ||                                         0.356220
                     |____________________|        |    |         |_________|       ||
                     |      4.032400               |    |         | 0.304000        ||
                     |_____________________________|    |         |_________________||
                                 2.032400               |               0.297780     |
                                                        |____________________________|
                                                                   0.387114
*/
}
