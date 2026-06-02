/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench | compare %f
// ASSERT: scan-begin BeforeAll: count = 1
// ASSERT: scan-after BeforeEach: count = 2
// ASSERT: scan-after AfterEach: count = 3
// ASSERT: scan-after BeforeEach: count = 4
// ASSERT: scan-after AfterEach: count = 5
// ASSERT: scan-after AfterAll: count = 6
// ASSERT: scan-4 case001
// ASSERT: scan-4 case002

import std.time.*

@Test
public class Test_Lifecycles_DataDSL_Bench {
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
        @Assert(count == 6)
    }

    @BeforeEach
    static func setup_beforeeach(): Unit {
        count += 1
        println("BeforeEach: count = ${count}")
    }

    @AfterEach
    static func setup_aftereach(): Unit {
        count += 1
        println("AfterEach: count = ${count}")
    }

    @Bench[a in [ 1, 2 ]]
    @Configure[minDuration: Duration.second]
    func case001(a: Int64): Unit {
        @Assert(count, 2)
    }

    @Bench[a in [ 1, 2 ], b in [ 0 ]]
    @Configure[minDuration: Duration.second]
    func case002(a: Int64, b: Int64): Unit {
        @Assert(count, 4)
    }
}
