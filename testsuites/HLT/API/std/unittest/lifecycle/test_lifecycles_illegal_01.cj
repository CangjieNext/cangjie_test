/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %cmp_utest_opt %f -o %output

@Test
public class Test_Lifecycles_Illegal {
    @BeforeAll
    @Skip
    public func setup_beforeall(): Unit {
    }

    @AfterAll
    @Skip
    private func setup_afterall(): Unit {
    }

    @BeforeEach
    @Skip
    static func setup_beforeeach(): Unit {
    }

    @AfterEach
    @Skip
    static func setup_aftereach(): Unit {
    }

    @TestCase
    func case001(): Unit {
    }
}
// ASSERT: scan macro_evaluate_failed
