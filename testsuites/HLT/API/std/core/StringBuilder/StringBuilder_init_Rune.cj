/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.math.*

@Test
class Test_stringBuilder_init {
    @TestCase
    func test_stringBuilder_init01(): Unit {
        let str = StringBuilder(r'a', 1024)
        @Expect(str.size, 1024)
        @Expect(str.capacity, 1056)
        @Expect(str.toString(), "a"*1024)
    }

    @TestCase
    func test_stringBuilder_array(): Unit {
        let arr = [r'1', r'a', r'一', r'に', r'!', r'\u{4f60}', r'\u{597d}']
        let str = StringBuilder(arr)
        @Expect(str.size, 15)
        @Expect(str.capacity, 47)
        @Expect(str.toString(), "1a一に!你好")
    }

    @TestCase
    func test_stringBuilder_capacity(): Unit {
        let str = StringBuilder(1024)
        @Expect(str.size, 0)
        @Expect(str.capacity, 1024)
        @Expect(str.toString(), "")
    }

    @TestCase
    func test_stringBuilder_zero(): Unit {
        let str1 = StringBuilder(r'a', 0)
        @Expect(str1.size, 0)
        @Expect(str1.capacity, 32)
        @Expect(str1.toString(), "")
    }

    @TestCase
    func test_stringBuilder_exception(): Unit {
        try {
            let str1 = StringBuilder(r'a', -1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The number of rune should not be negative.")
        }

        try {
            let str2 = StringBuilder(-1)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The capacity should be positive.")
        }

        try {
            let str3 = StringBuilder(0)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The capacity should be positive.")
        }
    }
}
