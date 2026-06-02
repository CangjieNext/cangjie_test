/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class Test_indexof_10 {
    @TestCase
    func test_indexof_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.indexOf("1"), Some(0))
        @Expect(str.indexOf("に"), Some(1))
        @Expect(str.indexOf("三"), Some(4))
        @Expect(str.indexOf("🙏🏿"), Some(7))
        @Expect(str.indexOf("👩‍👩‍👧‍👦"), Some(15))
        @Expect(str.indexOf("三🙏🏿"), Some(4))
        @Expect(str.indexOf("1に三🙏🏿👩‍👩‍👧‍👦"), Some(0))
    }

    @TestCase
    func test_indexof_not_exist_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.indexOf("4"), None)
        @Expect(str.indexOf("\0"), None)
        @Expect(str.indexOf("\u{20}"), None)
    }
}
