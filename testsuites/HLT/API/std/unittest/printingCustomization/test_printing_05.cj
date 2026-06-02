/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-capture-output --capture-output --parallel 2>&1 | compare %f
// ASSERT: scan UnittestCliOptionsFormatException: Should not use both --capture-output and --no-capture-output options at once.

//--no-capture-output --capture-output
@Test
@Parallel
public class Test_Printing_Conflicts {
    @BeforeAll
    public func setup_beforeall(): Unit {
        println("setup_beforeall")
    }

    @AfterAll
    private func setup_afterall(): Unit {
        println("setup_afterall")
    }

    @BeforeEach
    static func setup_beforeeach(): Unit {
        println("setup_beforeeach")
    }

    @AfterEach
    static func setup_aftereach(): Unit {
        println("setup_aftereach")
    }

    @TestCase
    func case001(): Unit {
        println("func case 001 running")
    }

    @TestCase
    func case002(): Unit {
        println("func case 002 running")
    }

    @TestCase
    func case003(): Unit {
        @FailExpect("func case 003 running")
    }
}
