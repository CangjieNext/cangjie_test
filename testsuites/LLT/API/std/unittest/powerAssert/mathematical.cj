/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 --no-color | compare %f
// ASSERT: scan-not REASON:

import std.unittest.*
import std.unittest.testmacro.*

func computeMyValue(x: Int64, y: Int64) {
    x * y - 23
}

extend Int64 {
    func reverse() {
        this * -1
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        @Expect(1 == 2)
        let myVal = 28
        @PowerAssert(1 + 4 + 10 == computeMyValue((5 - myVal).reverse(), 10) - 3 * computeMyValue(2.reverse(), 5))
    }
}

/* SCAN-IN
    Expect Failed: `(1 == 2 == true)`
       left: false
      right: true

    Assert Failed: `(1 + 4 + 10 == computeMyValue((5 - myVal).reverse(), 10) - 3 * computeMyValue(2.reverse(), 5))`
                    |_____|    |  |              ||   |_____|          |    | |   |              |___________|   |
                    |  5       |  |              ||      28 |          |    | |   |                    -2        |
                    |__________|  |              ||_________|          |    | |   |______________________________|
                         15       |              |    -23              |    | |                  -33             |
                                  |              |_____________________|    | |__________________________________|
                                  |                         23              |                  -99               |
                                  |_________________________________________|                                    |
                                  |                   207                                                        |
                                  |______________________________________________________________________________|
                                                                         306
 */
