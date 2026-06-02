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
// ASSERT: scan-begin BeforeAll: count = 1
// ASSERT: scan-next BeforeEach: count = 2
// ASSERT: scan-next in case001
// ASSERT: scan-next AfterEach: count = 3
// ASSERT: scan-next BeforeEach: count = 4
// ASSERT: scan-next in case002
// ASSERT: scan-next AfterEach: count = 5
// ASSERT: scan-next AfterAll: count = 6

@Test
public class Test_Function_Case {
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

    @TestCase
    func case001(): Unit {
        println("in case001")
        @Assert(count, 2)
    }

    @TestCase
    func case002(): Unit {
        println("in case002")
        @Assert(count, 4)
    }
}
