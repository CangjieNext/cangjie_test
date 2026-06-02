/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --death-aware 2>&1 | compare %f
// ASSERT: scan-1 ERROR: 2
// ASSERT: scan-1 CASE: ok1
// ASSERT: scan-1 CASE: ok2
// ASSERT: scan-1 CASE: ok3
// ASSERT: scan-1 CASE: ok4
// ASSERT: scan-2 CASE: crashTemplate
// ASSERT: scan-2 CASE: crashActual
// ASSERT: scan-1 Crashed with exit code 12.
// ASSERT: scan-1 Crashed with exit code 42.

import std.process.*

@TestTemplate
abstract class CrashingTemplate {
    @TestCase
    func ok1() {}

    @TestCase
    func crashTemplate() {
        Process.current.exit(12)
    }

    @TestCase
    func ok2() {}
}

@Test
class Tests <: CrashingTemplate {
    @TestCase
    func ok3() {}

    @TestCase
    func crashActual() {
        Process.current.exit(42)
    }

    @TestCase
    func ok4() {}
}
