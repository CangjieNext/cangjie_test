/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// ASSERT: scan-begin case001_BeforeEach: count = 1
// ASSERT: scan-next case001_AfterEach: count = 2
// ASSERT: scan-next case002_BeforeEach: count = 3
// ASSERT: scan-next case002_AfterEach: count = 4

import std.time.*

@Test
public class Test_Parameter_Lifecycles {
    static var count = 0

    @BeforeEach
    static func setup_beforeeach(casename: String): Unit {
        count += 1
        println("${casename}_BeforeEach: count = ${count}")
    }

    @AfterEach
    private func setup_aftereach(casename: String): Unit {
        count += 1
        println("${casename}_AfterEach: count = ${count}")
    }

    @TestCase
    func case001(): Unit {
        @Assert(count, 1)
    }

    @TestCase
    func case002(): Unit {
        @Assert(count, 3)
    }
}
