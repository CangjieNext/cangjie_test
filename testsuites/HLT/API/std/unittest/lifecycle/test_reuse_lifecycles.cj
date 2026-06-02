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
// ASSERT: scan-begin BeforeAll_1: count = 1
// ASSERT: scan-next BeforeAll_2: count = 2
// ASSERT: scan-next BeforeEach_1: count = 3
// ASSERT: scan-next BeforeEach_2: count = 4
// ASSERT: scan-next before case001
// ASSERT: scan-next in case001
// ASSERT: scan-next after case001
// ASSERT: scan-next AfterEach_1: count = 5
// ASSERT: scan-next AfterEach_2: count = 6
// ASSERT: scan-next BeforeEach_1: count = 7
// ASSERT: scan-next BeforeEach_2: count = 8
// ASSERT: scan-next before case002
// ASSERT: scan-next in case002
// ASSERT: scan-next after case002
// ASSERT: scan-next AfterEach_1: count = 9
// ASSERT: scan-next AfterEach_2: count = 10
// ASSERT: scan-next AfterAll_1: count = 11
// ASSERT: scan-next AfterAll_2: count = 12
// ASSERT: scan-next AfterAll_3: count = 13

@Test
public class Test_Reuse_Lifecycles {
    static var count = 0

    @BeforeAll
    public func setup_beforeall_1(): Unit {
        count += 1
        println("BeforeAll_1: count = ${count}")
        @Assert(count == 1)
    }

    @BeforeAll
    func setup_beforeall_2(): Unit {
        count += 1
        println("BeforeAll_2: count = ${count}")
        @Assert(count == 2)
    }

    @AfterAll
    private func setup_afterall_01(): Unit {
        count += 1
        println("AfterAll_1: count = ${count}")
        @Assert(count == 11)
    }

    @AfterAll
    static func setup_afterall_02(): Unit {
        count += 1
        println("AfterAll_2: count = ${count}")
        @Assert(count == 12)
    }

    @AfterAll
    static func setup_afterall_03(): Unit {
        count += 1
        println("AfterAll_3: count = ${count}")
        @Assert(count == 13)
    }

    @BeforeEach
    func setup_beforeeach_01(): Unit {
        count += 1
        println("BeforeEach_1: count = ${count}")
    }

    @BeforeEach
    static func setup_beforeeach_02(casename: String): Unit {
        count += 1
        println("BeforeEach_2: count = ${count}")
        println("before ${casename}")
    }

    @AfterEach
    static func setup_aftereach_01(casename: String): Unit {
        count += 1
        println("after ${casename}")
        println("AfterEach_1: count = ${count}")
    }

    @AfterEach
    private func setup_aftereach_02(casename: String): Unit {
        count += 1
        println("AfterEach_2: count = ${count}")
    }

    @TestCase
    func case001(): Unit {
        println("in case001")
        @Assert(count, 4)
    }

    @TestCase
    func case002(): Unit {
        println("in case002")
        @Assert(count, 8)
    }
}
