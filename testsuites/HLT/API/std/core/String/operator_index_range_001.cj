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
class Test_index_range_05 {
    /* UTF8编码字节值，长度为40,
    [49, 227, 129, 171, 228, 184, 137, 240, 159, 153,
    143, 240, 159, 143, 191, 240, 159, 145, 169, 226,
    128, 141, 240, 159, 145, 169, 226, 128, 141, 240,
    159, 145, 167, 226, 128, 141, 240, 159, 145, 166]*/
    @TestCase
    func test_lastIndexOf_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str[0], 49)
        @Expect(str[39], 166)
    }

    @TestCase
    func test_outofrange(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var a = str[-1]
            @Expect(1, 2)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message.contains("The length of the string is 40, but the index is -1"))
        }
    }
}
