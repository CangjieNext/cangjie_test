/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --parallel | compare %f
// ASSERT: scan-2 BeforeAll: count = 1
// ASSERT: scan-2 BeforeEach: count = 2
// ASSERT: scan-2 AfterEach: count = 3
// ASSERT: scan-2 AfterAll: count = 4

@Test
@Parallel
public class Test_Lifecycles_Parallel {
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

    @TestCase[a in [ 1, 2 ]]
    func case001(a: Int64): Unit {
        @Assert(count, 2)
    }

    @TestCase[a1 in [ 0, 1 ], a2 in [ "" ]]
    func case002(a1: Int64, a2: String): Unit {
        @Assert(count, 2)
    }
}
