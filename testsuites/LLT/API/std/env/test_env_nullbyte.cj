/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.env.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class EnvNullByteTest {
    @TestCase
    func test_setvariable_null_byte_key(): Unit {
        try {
            setVariable("key\0withnull", "value")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("null"))
        }
    }

    @TestCase
    func test_setvariable_null_byte_value(): Unit {
        try {
            setVariable("cj_test_key", "val\0withnull")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("null"))
        }
    }

    @TestCase
    func test_removevariable_null_byte(): Unit {
        try {
            removeVariable("key\0withnull")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("null"))
        }
    }

    @TestCase
    func test_getvariable_null_byte(): Unit {
        try {
            getVariable("key\0withnull")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("null"))
        }
    }

    @TestCase
    func test_set_remove_variable_normal(): Unit {
        setVariable("CJ_TEST_ENV_VAR", "hello")
        @Expect(getVariable("CJ_TEST_ENV_VAR") == Some("hello"))
        removeVariable("CJ_TEST_ENV_VAR")
        @Expect(getVariable("CJ_TEST_ENV_VAR") == None)
    }
}
