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
class Test_stringBuilder_size {
    @TestCase
    func test_stringBuilder_size01(): Unit {
        let str = StringBuilder(r'a', 1024)
        @Expect(str.size, 1024)
        @Expect(str.capacity, 1056)
        @Expect(str.toString(), "a"*1024)
    }

    @TestCase
    func test_stringBuilder_size02(): Unit {
        let str = StringBuilder(r'一', 1024)
        @Expect(str.size, 3072)
        @Expect(str.capacity, 3104)
        @Expect(str.toString(), "一"*1024)
    }

    @TestCase
    func test_stringBuilder_size03(): Unit {
        let str = StringBuilder(r'に', 1024)
        @Expect(str.size, 3072)
        @Expect(str.capacity, 3104)
        @Expect(str.toString(), "に"*1024)
    }

    @TestCase
    func test_stringBuilder_size04(): Unit {
        let str = StringBuilder(r'!', 1024)
        @Expect(str.size, 1024)
        @Expect(str.capacity, 1056)
        @Expect(str.toString(), "!"*1024)
    }

    @TestCase
    func test_stringBuilder_size05(): Unit {
        let str = StringBuilder(r'\0', 1024)
        @Expect(str.size, 1024)
        @Expect(str.capacity, 1056)
        @Expect(str.toString(), "\0"*1024)
    }

    @TestCase
    func test_stringBuilder_size06(): Unit {
        let str = StringBuilder(r'\u{4f60}', 1024)
        @Expect(str.size, 3072)
        @Expect(str.capacity, 3104)
        @Expect(str.toString(), "\u{4f60}"*1024)
    }

    @TestCase
    func test_stringBuilder_size07(): Unit {
        let str = StringBuilder()
        @Expect(str.size, 0)
        @Expect(str.capacity, 32)
        @Expect(str.toString(), "")
    }

    @TestCase
    func test_stringBuilder_size08(): Unit {
        let str = StringBuilder(32)
        @Expect(str.size, 0)
        @Expect(str.capacity, 32)
        @Expect(str.toString(), "")
    }
}
