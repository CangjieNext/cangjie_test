/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class RuneExtensionTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message == expectMessage) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAscii(): Bool
     */
    @TestCase
    func testIsAscii(): Unit {
        @Expect(r'a'.isAscii())
        @Expect(!r'仓'.isAscii())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiLetter(): Bool
     */
    @TestCase
    func testIsAsciiLetter(): Unit {
        @Expect(r'a'.isAsciiLetter())
        @Expect(r'A'.isAsciiLetter())
        @Expect(!r'0'.isAsciiLetter())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiNumber(): Bool
     */
    @TestCase
    func testIsAsciiNumber(): Unit {
        @Expect(r'0'.isAsciiNumber())
        @Expect(! r'a'.isAsciiNumber())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiHex(): Bool
     */
    @TestCase
    func testIsAsciiHex(): Unit {
        @Expect(r'a'.isAsciiHex())
        @Expect(r'0'.isAsciiHex())
        @Expect(! r'*'.isAsciiHex())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiLowerCase(): Bool
     */
    @TestCase
    func testIsAsciiLowerCase(): Unit {
        @Expect(r'a'.isAsciiLowerCase())
        @Expect(!r'A'.isAsciiLowerCase())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiUpperCase(): Bool
     */
    @TestCase
    func testIsAsciiUpperCase(): Unit {
        @Expect(r'A'.isAsciiUpperCase())
        @Expect(!r'a'.isAsciiUpperCase())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAsciiWhiteSpace(): Bool
     */
    @TestCase
    func testIsAsciiWhiteSpace(): Unit {
        @Expect(r'\u{000D}'.isAsciiWhiteSpace())
        @Expect(r'\u{0020}'.isAsciiWhiteSpace())
        @Expect(!r'a'.isAsciiWhiteSpace())
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func toAsciiUpperCase(): Bool
     */
    @TestCase
    func testToAsciiUpperCase(): Unit {
        @Expect(r'a'.toAsciiUpperCase(),r'A')
        @Expect(r'A'.toAsciiUpperCase(),r'A')
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func toAsciiLowerCase(): Bool
     */
    @TestCase
    func testToAsciiLowerCase(): Unit {
        @Expect(r'A'.toAsciiLowerCase(),r'a')
        @Expect(r'a'.toAsciiLowerCase(),r'a')
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func fromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)
     */
    @TestCase
    func testFromUtf8(): Unit {
        var arr: Array<UInt8> = [
            0b00111111,
            0b11011111,
            0b10111111,
            0b11101111,
            0b10111111,
            0b10111111,
            0b11110100,
            0b10001111,
            0b10111111,
            0b10111111,
            0b11111011,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111,
            0b11111101,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111
        ]
        @Expect(Rune.fromUtf8(arr, 0)==(r'\u{3F}', 1))
        @Expect(Rune.fromUtf8(arr, 1)==(r'\u{7FF}', 2))
        @Expect(Rune.fromUtf8(arr, 3)==(r'\u{FFFF}', 3))
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func fromUtf8(arr: Array<UInt8>, index: Int64): (Rune, Int64)
     */
    @TestCase
    func testInvalidFromUtf8(): Unit {
        var arr_illegal: Array<UInt8> = [0b10111111]
        var caseException01: ?Exception = None
        try {
            Rune.fromUtf8(arr_illegal, 0)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert("testInvalidFromUtf8_01", caseException01, "Invalid utf8 byte sequence.")

        var caseException02: ?Exception = None
        try {
            Rune.fromUtf8([97u8, 97u8, 97u8, 97u8, 97u8, 250u8, 97u8], 5)
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert("testInvalidFromUtf8_02", caseException02, "Invalid unicode scalar value.")
        var caseException03: ?Exception = None
        try {
            Rune.fromUtf8([250u8, 170u8, 170u8, 170u8, 170u8], 0)
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert("testInvalidFromUtf8_03", caseException03, "Invalid unicode scalar value.")

        // Test 5-byte UTF-8 sequence (0xF8 = 0b11111000) - should be rejected
        var arr5Byte: Array<UInt8> = [0b11111000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException04: ?Exception = None
        try {
            Rune.fromUtf8(arr5Byte, 0)
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert("testInvalidFromUtf8_5byte_0xF8", caseException04, "Invalid unicode scalar value.")

        // Test 5-byte UTF-8 sequence (0xFB = 0b11111011) - should be rejected
        var arr5Byte2: Array<UInt8> = [0b11111011, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException05: ?Exception = None
        try {
            Rune.fromUtf8(arr5Byte2, 0)
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert("testInvalidFromUtf8_5byte_0xFB", caseException05, "Invalid unicode scalar value.")

        // Test 6-byte UTF-8 sequence (0xFC = 0b11111100) - should be rejected
        var arr6Byte: Array<UInt8> = [0b11111100, 0b10000000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException06: ?Exception = None
        try {
            Rune.fromUtf8(arr6Byte, 0)
        } catch (e: IllegalArgumentException) {
            caseException06 = e
        }
        anomalyAssert("testInvalidFromUtf8_6byte_0xFC", caseException06, "Invalid unicode scalar value.")

        // Test 6-byte UTF-8 sequence (0xFD = 0b11111101) - should be rejected
        var arr6Byte2: Array<UInt8> = [0b11111101, 0b10000000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException07: ?Exception = None
        try {
            Rune.fromUtf8(arr6Byte2, 0)
        } catch (e: IllegalArgumentException) {
            caseException07 = e
        }
        anomalyAssert("testInvalidFromUtf8_6byte_0xFD", caseException07, "Invalid unicode scalar value.")
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func utf8Size(arr: Array<UInt8>, index: Int64): Int64
     */
    @TestCase
    func testUtf8Size(): Unit {
        var c1: Rune = '\u{007F}'
        var c2: Rune = '\u{07FF}'
        var c3: Rune = '\u{FFFF}'
        var c4: Rune = '\u{10FFFF}'

        @Expect(Rune.utf8Size(c1), 1)
        @Expect(Rune.utf8Size(c2), 2)
        @Expect(Rune.utf8Size(c3), 3)

        @Expect(Rune.utf8Size(c4), 4)
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func utf8Size(arr: Array<UInt8>, index: Int64): Int64
     */
    @TestCase
    func testInvalidUtf8Size(): Unit {
        var arr: Array<UInt8> = [
            0b00111111,
            0b11011111,
            0b10111111,
            0b11101111,
            0b10111111,
            0b10111111,
            0b11110100,
            0b10001111,
            0b10111111,
            0b10111111,
            0b11111011,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111,
            0b11111101,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111,
            0b10111111
        ]
        var caseException01: ?Exception = None
        try {
            Rune.utf8Size(arr, 5)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidRuneExtension_01",
            caseException01,
            "Byte index 5 is not a Rune boundary, it is inside '￿'."
        )

        // Test 5-byte UTF-8 leading byte (0xF8 = 0b11111000)
        var arr5Byte: Array<UInt8> = [0b11111000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException02: ?Exception = None
        try {
            Rune.utf8Size(arr5Byte, 0)
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidUtf8Size_5byte_0xF8",
            caseException02,
            "Invalid UTF-8 character."
        )

        // Test 5-byte UTF-8 leading byte (0xFB = 0b11111011)
        var arr5Byte2: Array<UInt8> = [0b11111011, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException03: ?Exception = None
        try {
            Rune.utf8Size(arr5Byte2, 0)
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidUtf8Size_5byte_0xFB",
            caseException03,
            "Invalid UTF-8 character."
        )

        // Test 6-byte UTF-8 leading byte (0xFC = 0b11111100)
        var arr6Byte: Array<UInt8> = [0b11111100, 0b10000000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException04: ?Exception = None
        try {
            Rune.utf8Size(arr6Byte, 0)
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert(
            "testInvalidUtf8Size_6byte_0xFC",
            caseException04,
            "Invalid UTF-8 character."
        )

        // Test 6-byte UTF-8 leading byte (0xFD = 0b11111101)
        var arr6Byte2: Array<UInt8> = [0b11111101, 0b10000000, 0b10000000, 0b10000000, 0b10000000, 0b10000000]
        var caseException05: ?Exception = None
        try {
            Rune.utf8Size(arr6Byte2, 0)
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert(
            "testInvalidUtf8Size_6byte_0xFD",
            caseException05,
            "Invalid UTF-8 character."
        )
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func intoUtf8Array(c: Rune, arr: Array<UInt8>, index: Int64): Int64
     */
    @TestCase
    func testIntoUtf8Array(): Unit {
        var c1: Rune = '\u{007F}'
        var c2: Rune = '\u{07FF}'
        var c3: Rune = '\u{FFFF}'
        var c4: Rune = '\u{10FFFF}'
        var arr_in = Array<UInt8>(22, repeat: 0b00000000)
        var index: Int64 = 0
        index += Rune.intoUtf8Array(c1, arr_in, index)
        index += Rune.intoUtf8Array(c2, arr_in, index)
        index += Rune.intoUtf8Array(c3, arr_in, index)
        index += Rune.intoUtf8Array(c4, arr_in, index)
        @Expect(index, 10)
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public static func intoUtf8Array(c: Rune, arr: Array<UInt8>, index: Int64): Int64
     */
    @TestCase
    func testInvalidIntoUtf8Array(): Unit {
        var caseException01: ?Exception = None
        try {
            Rune.intoUtf8Array(r'中', [8u8, 1u8, 3u8, 5u8], 2)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidIntoUtf8Array_01",
            caseException01,
            "The bytecode position occupied by this character is outside the range of the array."
        )

        var caseException02: ?Exception = None
        try {
            Rune.intoUtf8Array(r'a', [8u8, 1u8, 3u8, 5u8], 4)
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidIntoUtf8Array_02",
            caseException02,
            "The bytecode position occupied by this character is outside the range of the array."
        )
    }

    /*
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func compare(rhs: Rune): Ordering
     */
    @TestCase
    func testCompare(): Unit {
        @Expect(r'A'.compare(r'a'), Ordering.LT)
        @Expect(r'a'.compare(r'A'), Ordering.GT)
    }
}
