/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.env.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_env_variable_failure {
    @TestCase
    func case_test_setVariable_fail(): Unit {
        try {
            setVariable("a=b", "c")
            @Expect(false)
        } catch (e: EnvException) {
            @Expect(e.message.contains("Failed to set variable a=b."))
        }
    }

    @TestCase
    func case_test_removeVariable_fail(): Unit {
        try {
            removeVariable("a=b")
            @Expect(false)
        } catch (e: EnvException) {
            @Expect(e.message.contains("Failed to remove variable a=b."))
        }
    }
}
