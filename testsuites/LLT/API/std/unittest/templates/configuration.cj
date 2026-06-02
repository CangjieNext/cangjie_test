/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --parallel 2>&1 | compare %f
// ASSERT: scan [ FAILED ] CASE: enabled
// ASSERT: scan-not [ PASSED ] CASE: enabled
// ASSERT: scan [ PASSED ] CASE: disabled
// ASSERT: scan-not [ FAILED ] CASE: disabled

import std.time.*

// We do not have proper way to get actual configuration, so use
// timeout option side effect to track configuration changes.
let disabled = Duration.second * 2 // Tests with this configuration will pass
let enabled = Duration.second * 0.1

func test() {
    sleep(Duration.second)
}

@TestTemplate
@Configure[timeout: enabled]
abstract class EnablingExpectEnabled {
    @TestCase
    func enabled1() {
        test()
    }
}

@Test
class Inheriting <: EnablingExpectEnabled {
    @TestCase
    func enabled2() {
        test()
    }
}

@TestTemplate
abstract class ExpectEnabled <: EnablingExpectEnabled {
    @TestCase
    func enabled2() {
        test()
    }
}

@Test
class DeepInheriting <: ExpectEnabled {
    @TestCase
    func enabled3() {
        test()
    }
}

@TestTemplate
@Configure[timeout: enabled]
abstract class EnablingExpectDisabled {
    @TestCase
    func disabled1() {
        test()
    }
}

@Test
@Configure[timeout: disabled]
class Overriding <: EnablingExpectDisabled {
    @TestCase
    func disabled2() {
        test()
    }
}

@TestTemplate
@Configure[timeout: disabled]
abstract class DisablingExpectDisabled <: EnablingExpectDisabled {
    @TestCase
    func disabled2() {
        test()
    }
}

@Test
class InheritingOverriden <: DisablingExpectDisabled {
    @TestCase
    func disabled3() {
        test()
    }
}
