/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args 
@Test
class Test_lastIndexOf_10 {
    @TestCase
    func test_lastIndexOf_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.lastIndexOf("1"), Some(40))
        @Expect(str.lastIndexOf("に"), Some(41))
        @Expect(str.lastIndexOf("三"), Some(44))
        @Expect(str.lastIndexOf("🙏🏿"), Some(47))
        @Expect(str.lastIndexOf("👩‍👩‍👧‍👦"), Some(55))
        @Expect(str.lastIndexOf("三🙏🏿"), Some(44))
        @Expect(str.lastIndexOf("1に三🙏🏿👩‍👩‍👧‍👦"), Some(40))
    }

    @TestCase
    func test_lastIndexOf_not_exist_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.lastIndexOf("4"), None)
        @Expect(str.lastIndexOf("\0"), None)
        @Expect(str.lastIndexOf("\u{20}"), None)
    }
}
