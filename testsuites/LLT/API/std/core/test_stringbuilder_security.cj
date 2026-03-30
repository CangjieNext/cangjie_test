/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.core.*

@Test
class StringBuilderSecurityTest {
    
    @TestCase
    func test_init_rune_normal() {
        let sb = StringBuilder(r'a', 100)
        @Expect(sb.size, 100)
        @Expect(sb.toString(), "a" * 100)
    }
    
    @TestCase
    func test_init_rune_zero() {
        let sb = StringBuilder(r'a', 0)
        @Expect(sb.size, 0)
        @Expect(sb.capacity, 32)
        @Expect(sb.toString(), "")
    }
    
    @TestCase
    func test_init_rune_negative() {
        var caught = false
        try {
            let sb = StringBuilder(r'a', -1)
        } catch (e: IllegalArgumentException) {
            caught = true
            @Expect(e.message, "The number of rune should not be negative.")
        }
        @Expect(caught, true)
    }
    
    @TestCase
    func test_init_rune_overflow() {
        var caught = false
        try {
            let sb = StringBuilder(r'a', Int64.Max)
        } catch (e: IllegalArgumentException) {
            caught = true
            @Expect(e.message, "The size of StringBuilder is too large.")
        }
        @Expect(caught, true)
    }
    
    @TestCase
    func test_init_rune_multibyte_overflow() {
        var caught = false
        try {
            let sb = StringBuilder(r'中', Int64.Max / 3 + 1)
        } catch (e: IllegalArgumentException) {
            caught = true
            @Expect(e.message, "The size of StringBuilder is too large.")
        }
        @Expect(caught, true)
    }
    
    @TestCase
    func test_init_rune_4byte_overflow() {
        var caught = false
        try {
            let sb = StringBuilder(r'😀', Int64.Max / 4 + 1)
        } catch (e: IllegalArgumentException) {
            caught = true
            @Expect(e.message, "The size of StringBuilder is too large.")
        }
        @Expect(caught, true)
    }
}
