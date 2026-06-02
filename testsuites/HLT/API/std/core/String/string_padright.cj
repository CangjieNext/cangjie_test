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
class Test_padEnd_05 {
    @TestCase
    func test_need_padEnd(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        var padstr1 = str.padEnd(50, padding: "12")
        @Expect(padstr1.size, 50)
        @Expect(padstr1, "1に三🙏🏿👩‍👩‍👧‍👦1212121212")

        var padstr2 = str.padEnd(50, padding: "🙏🏿")
        @Expect(padstr2.size, 56)
        @Expect(padstr2, "1に三🙏🏿👩‍👩‍👧‍👦🙏🏿🙏🏿")

        var padstr3 = str.padEnd(50, padding: "👩‍👩‍👧‍👦‍")
        @Expect(padstr3.size, 68)
        @Expect(padstr3, "1に三🙏🏿👩‍👩‍👧‍👦👩‍👩‍👧‍👦‍")
    }

    @TestCase
    func test_not_need_padEnd(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        var padstr1 = str.padEnd(40, padding: "12")
        @Expect(padstr1.size, 40)
        @Expect(padstr1, "1に三🙏🏿👩‍👩‍👧‍👦")

        var padstr2 = str.padEnd(39, padding: "12")
        @Expect(padstr2.size, 40)
        @Expect(padstr2, "1に三🙏🏿👩‍👩‍👧‍👦")
    }

    @TestCase
    func test_illegal_width(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var padstr = str.padEnd(-1, padding: "12")
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Negative totalWidth.")
        }
    }
}
