/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestCCC {
    @TestCase
    func sayhi(): Unit {
        @Assert("one".toArray(), "tow three".toArray())
    }
}

/* SCAN-IN
        Different sizes: 3("one".toArray()) != 9("tow three".toArray())
        Different elements (left - "one".toArray(), right - "tow three".toArray()):
            [0]: 111 != 116
            [1]: 110 != 111
            [2]: 101 != 119
 */
