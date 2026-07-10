/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * Incremental coverage for std.core string_common.cj via String.checkUtf8Encoding:
 * 1/2/3/4-byte UTF-8 validation branches (including WithoutException paths).
 */
@Test
class StringCommonCoverageTest {
    @TestCase
    func testOneByteUtf8(): Unit {
        @Expect(String.checkUtf8Encoding([0x31]), true)
        @Expect(String.checkUtf8Encoding([0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11100000]), false)
        @Expect(String.checkUtf8Encoding([0b11110000]), false)
    }

    @TestCase
    func testTwoByteUtf8(): Unit {
        @Expect(String.checkUtf8Encoding([0b10000000, 0x80]), false)
        @Expect(String.checkUtf8Encoding([0b10111111, 0x80]), false)
        @Expect(String.checkUtf8Encoding([0b11000000, 0x80]), false)
        @Expect(String.checkUtf8Encoding([0b11011111, 0x80]), true)
        @Expect(String.checkUtf8Encoding([0b11100000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11110000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11000000, 0x80]), false)
    }

    @TestCase
    func testThreeByteUtf8(): Unit {
        @Expect(String.checkUtf8Encoding([0b11100000, 0b10000000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11101101, 0b10100000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11100000, 0b10111111, 0b10111111]), true)
        @Expect(String.checkUtf8Encoding([0b11110000, 0b10000000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11100000, 0b10000000]), false)
    }

    @TestCase
    func testFourByteUtf8(): Unit {
        @Expect(String.checkUtf8Encoding([0b11110111, 0b10000000, 0b10000000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11110000, 0b10000000, 0b10000000, 0b10000000]), false)
        @Expect(String.checkUtf8Encoding([0b11110000, 0b10000000, 0b10000000]), false)
        @Expect(
            String.checkUtf8Encoding([0b11110000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]),
            false
        )
    }

    @TestCase
    func testTruncatedAndValidSequences(): Unit {
        @Expect(String.checkUtf8Encoding([0xE4, 0xB8, 0xAD, 0xE5]), false)
        @Expect(String.checkUtf8Encoding([0xE4, 0xB8, 0xAD]), true)
        @Expect(String.checkUtf8Encoding(Array<Byte>()), true)
        @Expect(String.checkUtf8Encoding("abc".toArray()), true)
    }
}
