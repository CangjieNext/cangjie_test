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
class Test_index_range_06 {
    /* UTF8编码字节值，长度为40,
    [49, 227, 129, 171, 228, 184, 137, 240, 159, 153,
    143, 240, 159, 143, 191, 240, 159, 145, 169, 226,
    128, 141, 240, 159, 145, 169, 226, 128, 141, 240,
    159, 145, 167, 226, 128, 141, 240, 159, 145, 166]*/
    @TestCase
    func test_lastIndexOf_string(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        @Expect(str[0..1], "1")
        @Expect(str[1..7], "に三")
        @Expect(str[7..40:1], "🙏🏿👩‍👩‍👧‍👦")
        @Expect(str[0..40], "1に三🙏🏿👩‍👩‍👧‍👦")
    }

    @TestCase
    func test_outofrange_01(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var a = str[-1..1]
            @Expect(1, 2)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "Invalid range: start is '-1', end is '1', but size is '40'.")
        }
    }

    @TestCase
    func test_outofrange_02(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var a = str[1..41]
            @Expect(1, 2)
        } catch (e: IndexOutOfBoundsException) {
            @Expect(e.message, "Invalid range: start is '1', end is '41', but size is '40'.")
        }
    }

    @TestCase
    func test_outofrange_03(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var a = str[1..7 : 2]
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "String slice step must be 1, got '2'.")
        }
    }

    @TestCase
    func test_outofrange_04(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
            let e = @AssertThrows[IllegalArgumentException](str[1..7:-1])
            @Expect(e.message, "String slice step must be 1, got '-1'.")
    }

    @TestCase
    func test_outofrange_05(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
            let e = @AssertThrows[IllegalArgumentException](str[2..7])
            @Expect(e.message, "Invalid UTF-8 byte sequence: index '2' is not a code point boundary.")
    }

    @TestCase
    func test_outofrange_06(): Unit {
        let str = "1に三🙏🏿👩‍👩‍👧‍👦"
        try {
            var a = str[1..8]
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid UTF-8 byte sequence: index '8' is not a code point boundary.")
        }
    }
}
