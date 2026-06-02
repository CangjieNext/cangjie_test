/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f --test -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args --no-color --dry-run 2>&1 | compare %f
// ASSERT: scan-not should not be displayed

import std.process.*

@Test
class Suite {
    @BeforeAll
    @AfterAll
    @BeforeEach
    @AfterEach
    func lifecycle() {
        println("should not be displayed")
    }

    @TestCase
    func case1() {}
}
