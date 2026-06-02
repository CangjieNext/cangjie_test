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
class Test_lastIndexOf_with_fromIndex {
    @TestCase
    func test_lastIndexOf_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.lastIndexOf("三", -1), Some(44))
        @Expect(str.lastIndexOf("三", 0), Some(44))
        @Expect(str.lastIndexOf("三", 4), Some(44))
        @Expect(str.lastIndexOf("三", 5), Some(44))
        @Expect(str.lastIndexOf("三", 44), Some(44))
        @Expect(str.lastIndexOf("三", 45), None)
        @Expect(str.lastIndexOf("三", 80), None)
        @Expect(str.lastIndexOf("三", 81), None)
    }

    @TestCase
    func test_lastIndexOf_not_exist_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.lastIndexOf("四",-1), None)
        @Expect(str.lastIndexOf("\0",81), None)
        @Expect(str.lastIndexOf("\u{20}",0), None)
    }
}
