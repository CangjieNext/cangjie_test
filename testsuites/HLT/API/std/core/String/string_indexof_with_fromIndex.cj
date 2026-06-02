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
class Test_indexof_with_fromIndex {
    @TestCase
    func test_indexof_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.indexOf("三", -1), Some(4))
        @Expect(str.indexOf("三", 0), Some(4))
        @Expect(str.indexOf("三", 4), Some(4))
        @Expect(str.indexOf("三", 5), Some(44))
        @Expect(str.indexOf("三", 44), Some(44))
        @Expect(str.indexOf("三", 45), None)
        @Expect(str.indexOf("三", 80), None)
        @Expect(str.indexOf("三", 81), None)
    }

    @TestCase
    func test_indexof_not_exist_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str.indexOf("四",-1), None)
        @Expect(str.indexOf("\0",81), None)
        @Expect(str.indexOf("\u{20}",0), None)
    }
}
