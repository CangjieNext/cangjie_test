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
// ASSERT: scan-next AfterEach: count = 3
// ASSERT: scan-next BeforeEach: count = 4
// ASSERT: scan-next AfterEach: count = 5
// ASSERT: scan-next BeforeEach: count = 6
// ASSERT: scan-next AfterEach: count = 7
// ASSERT: scan-next AfterAll: count = 8
// ASSERT: scan-3 case001

@Test
public class Test_Lifecycles_Types {
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
        @Assert(count == 8)
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
    @Types[U in<Int64, Float64, String>]
    func case001<U>(): Unit where U <: Hashable {
        @Expect(Array<U>().size, 0)
    }
}
