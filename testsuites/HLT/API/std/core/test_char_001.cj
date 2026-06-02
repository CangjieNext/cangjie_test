/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*

@Test
class test_char_1 {
    var ch1 = r'\u{0020}'
    var ch2 = r'\u{0009}'
    var ch3 = r'\u{000D}'
    var ch4 = r'\u{0041}' //A
    var ch5 = r'\u{005A}' //Z
    var ch6 = r'\u{0061}' //a
    var ch7 = r'\u{007A}' //z

    @TestCase
    func test_isAsciiWhiteSpace(): Unit {
        @Expect(ch1.isAsciiWhiteSpace())
        @Expect(ch2.isAsciiWhiteSpace())
        @Expect(ch3.isAsciiWhiteSpace())
    }

    @TestCase
    func test_toAsciiUpperCase(): Unit {
        @Expect(ch4.toAsciiUpperCase(), ch4)
        @Expect(ch6.toAsciiUpperCase(), ch4)
        @Expect(ch7.toAsciiUpperCase(), ch5)
    }

    @TestCase
    func test_toAsciiLowerCase(): Unit {
        @Expect(ch6.toAsciiLowerCase(), ch6)
        @Expect(ch4.toAsciiLowerCase(), ch6)
        @Expect(ch5.toAsciiLowerCase(), ch7)
    }
}
