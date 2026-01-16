/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.string_intern.*

/*
 * Test description: Test the funcs for Internable
 * Test class:
 * public interface Internable
 */
@Test
public class StringInternTest {

    @TestCase
    func should_throw_error_when_input_negative(): Unit {
        @ExpectThrows[IllegalArgumentException]({
        String.configInternPool(capacity: - 1, strMaxLength: 1)
        })

        @ExpectThrows[IllegalArgumentException]({
        String.configInternPool(capacity: 1, strMaxLength: - 1)
        })
    }

    @TestCase
    func should_throw_error_when_input_zero(): Unit {
        @ExpectThrows[IllegalArgumentException]({
        String.configInternPool(capacity: 0, strMaxLength: 1)
        })

        @ExpectThrows[IllegalArgumentException]({
        String.configInternPool(capacity: 1, strMaxLength: 0)
        })
    }

    @TestCase
    func should_go_when_input_positive(): Unit {
        String.configInternPool(capacity: 10000, strMaxLength: 1000)
        String.intern("hello, 仓颉")
        String.intern(unsafe { "hello, 仓颉".rawData() })
    }
}
