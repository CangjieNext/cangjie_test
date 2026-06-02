/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan [ PASSED ] CASE: Y_X
// ASSERT: scan-4 [ ERROR  ]
// ASSERT: scan-1 After all step failed.
// ASSERT: scan-1 Tests not run.
// ASSERT: scan-1 After each step failed.
// ASSERT: scan-1 Before each step failed.
// ASSERT: scan-1 Before all step failed.
// ASSERT: scan-1 TOTAL: 5
// ASSERT: scan-1 PASSED: 1
// ASSERT: scan-1 ERROR: 4

@Test
class X {
    @BeforeAll
    public func X_BEFORE_ALL() {
        throw Exception("failed")
    }

    @TestCase
    func X_X() {
    }
}

@Test
class Y {
    @AfterAll
    public func Y_AFTER_ALL() {
        throw Exception("failed")
    }

    @TestCase
    func Y_X() {
    }
}

@Test
class Z {
    @BeforeEach
    public func Z_BEFORE_EACH() {
        throw Exception("failed")
    }

    @TestCase
    func Z_X() {
    }
}

@Test
class W {
    @AfterEach
    public func W_BEFORE_EACH() {
        throw Exception("failed")
    }

    @TestCase
    func W_X() {
    }
}
