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
class Test_padStart_05 {
    @TestCase
    func test_need_padStart(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        var padstr1 = str.padStart(50, padding: "12")
        @Expect(padstr1.size, 50)
        @Expect(padstr1, "12121212121に三🙏🏿👩‍👩‍👧‍👦")

        var padstr2 = str.padStart(50, padding: "🙏🏿")
        @Expect(padstr2.size, 56)
        @Expect(padstr2, "🙏🏿🙏🏿1に三🙏🏿👩‍👩‍👧‍👦")

        var padstr3 = str.padStart(50, padding: "👩‍👩‍")
        @Expect(padstr3.size, 54)
        @Expect(padstr3, "👩‍👩‍1に三🙏🏿👩‍👩‍👧‍👦")
    }

    @TestCase
    func test_not_need_padStart(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        var padstr1 = str.padStart(40, padding: "12")
        @Expect(padstr1.size, 40)
        @Expect(padstr1, "1に三🙏🏿👩‍👩‍👧‍👦")

        var padstr2 = str.padStart(39, padding: "12")
        @Expect(padstr2.size, 40)
        @Expect(padstr2, "1に三🙏🏿👩‍👩‍👧‍👦")
    }

    @TestCase
    func test_illegal_width(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var padstr = str.padStart(-1, padding: "12")
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid argument 'totalWidth': expected a non-negative value, got '-1'.")
        }
    }
}
