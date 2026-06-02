/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan Test case ended with timeout
// ASSERT: scan BeforeAll: count = 1
// ASSERT: scan BeforeEach: count = 2

import std.time.*
import std.sync.*

@Test
public class Test_Lifecycles_Timeout {
    static var count = 0

    @BeforeAll
    public func setup_beforeall(): Unit {
        count += 1
        println("BeforeAll: count = ${count}")
        @Assert(count == 1)
    }

    @AfterAll
    private func setup_afterall(): Unit {
        count += 1
        println("AfterAll: count = ${count}")
        @Assert(count == 4)
    }

    @BeforeEach
    static func setup_beforeeach(): Unit {
        count += 1
        println("BeforeEach: count = ${count}")
        @Assert(count == 2)
    }

    @AfterEach
    static func setup_aftereach(): Unit {
        count += 1
        println("AfterEach: count = ${count}")
        @Assert(count == 3)
    }

    @TestCase
    @Timeout[Duration.second]
    func case001(): Unit {
        @Assert(count, 2)
        sleep(Duration.second * 10)
        @Assert(count, 100)
    }
}
