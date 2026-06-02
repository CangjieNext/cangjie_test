/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

@Test
public class Test_AssertEqual_String {
    @TestCase
    func test_assert_string(): Unit {
        let str1 = """
Hello,
Cangjie Lang"""
        let str2 = "Hello,\nCangjie Lang"
        let str3 = ###"Hello,
Cangjie Lang"###
        @Expect(str1, str2)
        @Expect(str1, str3)
        @Expect(str2, str3)
    }

    @TestCase
    func test_special_char() {
        @Expect("\u{123}", "ģ")
        @Expect("仓颉，你好😀 😍 😢 😠 😴 😎 🤔 😵 😜 🤣", "仓颉，你好😀 😍 😢 😠 😴 😎 🤔 😵 😜 🤣")
    }
}
