/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*

@Test
class BigPropTest {
    @TestCase
    func propSignTest() {
        var bytes: Array<Byte> = [128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        var i = BigInt(bytes)
        @Expect(i.sign, -1)
        bytes = [0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.sign, 1)
        bytes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.sign, 0)
    }

    @TestCase
    func propBitLenTest() {
        var i = BigInt(1)
        @Expect(i.bitLen, 1)
        i = BigInt(-1)
        @Expect(i.bitLen, 2)
        i = BigInt(-2)
        @Expect(i.bitLen, 2)
        i = BigInt(2)
        @Expect(i.bitLen, 2)
        i = BigInt(3)
        @Expect(i.bitLen, 2)
        i = BigInt(-3)
        @Expect(i.bitLen, 3)
        i = BigInt(0)
        @Expect(i.bitLen, 1)
        var bytes: Array<Byte> = [128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+8)
        bytes = [0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+8)
        bytes = [3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+2)
        bytes = [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+1)
        bytes = [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+8)
        // 11111110 ...
        bytes = [254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+2)
        // 11111101 ...
        bytes = [253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+3)
        // 11111100 ...
        bytes = [252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        i = BigInt(bytes)
        @Expect(i.bitLen, 13*8+3)
    }

    @TestCase
    func testBitTest() {
        var i = BigInt(0)
        try {
            i.testBit(-1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
        @Expect(i.testBit(0), false)
        @Expect(i.testBit(10), false)
        i = BigInt(1)
        @Expect(i.testBit(0), true)
        @Expect(i.testBit(1), false)
        i = BigInt(-1)
        @Expect(i.testBit(0), true)
        @Expect(i.testBit(1), true)
        @Expect(i.testBit(10086), true)
        let s = "0" * 10086
        let ss = "1" + s
        i = BigInt.parse(ss, radix: 2)
        @Expect(i.testBit(10086), true)
        @Expect(i.testBit(10085), false)
        @Expect(i.testBit(100850), false)
        i = BigInt.parse("-10000000000000000", radix: 16)
        @Expect(i.testBit(10086), true)
        @Expect(i.testBit(64), true)
        @Expect(i.testBit(65), true)
        @Expect(i.testBit(63), false)
        @Expect(i.testBit(0), false)
        @Expect(i.toString(radix: 16), "-10000000000000000")
    }

    @TestCase
    func trailingZerosTest() {
        var i = BigInt(0)
        @Expect(trailingZeros(i), -1)
        i = BigInt(1)
        @Expect(trailingZeros(i), 0)
        i = BigInt(-1)
        @Expect(trailingZeros(i), 0)
        i = BigInt.parse("8000000000000000", radix: 16)
        @Expect(trailingZeros(i), 63)
        i = BigInt(-0x8000_0000_0000_0000)
        @Expect(trailingZeros(i), 63)
        var bytes: Array<Byte> = [128, 0b00110000, 0, 0]
        i = BigInt(bytes)
        @Expect(trailingZeros(i), 20)
        bytes = [0, 128, 0b00110000, 0, 0]
        i = BigInt(bytes)
        @Expect(trailingZeros(i), 20)
        i = BigInt("10000000000000000000000")
        @Expect(trailingZeros(i), 22)
        i = BigInt("-10000000000000000000000")
        @Expect(trailingZeros(i), 22)
        i = BigInt("1234567890012345678900")
        @Expect(trailingZeros(i), 2)
        i = BigInt("-1234567890012345678900")
        @Expect(trailingZeros(i), 2)
        i = BigInt("78900")
        @Expect(trailingZeros(i), 2)
        i = BigInt("-78900")
        @Expect(trailingZeros(i), 2)
    }

    @TestCase
    func setBitTest() {
        var i = BigInt(0)
        try {
            i.setBit(-1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
        var ii = i.setBit(1)
        @Expect(ii.toString(), "2")
        ii = i.setBit(0)
        @Expect(ii.toString(), "1")
        ii = i.setBit(64)
        @Expect(ii.toString(), "18446744073709551616")
        i = BigInt(5)
        ii = i.setBit(1)
        @Expect(ii.toString(), "7")
        ii = i.setBit(2)
        @Expect(ii.toString(), "5")
        ii = i.setBit(64)
        @Expect(ii.toString(), "18446744073709551621")
        i = BigInt.parse("10000000000000000", radix: 16)
        ii = i.setBit(0)
        @Expect(ii.toString(radix: 16), "10000000000000001")
        ii = i.setBit(65)
        @Expect(ii.toString(radix: 16), "30000000000000000")
        ii = i.setBit(96)
        @Expect(ii.toString(radix: 16), "1000000010000000000000000")
        i = BigInt(-5)
        ii = i.setBit(1)
        @Expect(ii.toString(), "-5")
        ii = i.setBit(2)
        @Expect(ii.toString(), "-1")
        ii = i.setBit(64)
        @Expect(ii.toString(), "-5")
        i = BigInt.parse("-fffff0000", radix: 16)
        ii = i.setBit(33)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-dffff0000")
        i = BigInt.parse("-1000000000000000000000000000", radix: 16)
        ii = i.setBit(0)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-fffffffffffffffffffffffffff")
        ii = i.setBit(100860)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-1000000000000000000000000000")
        ii = i.setBit(64)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-fffffffffff0000000000000000")
    }

    @TestCase
    func clearBitTest() {
        var i = BigInt(0)
        try {
            i.clearBit(-1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
        var ii = i.clearBit(1)
        @Expect(ii.toString(), "0")
        ii = i.clearBit(10086)
        @Expect(ii.toString(), "0")
        i = BigInt.parse("ffff", radix: 16)
        ii = i.clearBit(16)
        @Expect(ii.toString(radix: 16), "FFFF")
        ii = i.clearBit(64)
        @Expect(ii.toString(radix: 16), "FFFF")
        ii = i.clearBit(15)
        @Expect(ii.toString(radix: 16), "7FFF")
        i = BigInt.parse("fffffffffffffffff", radix: 16)
        ii = i.clearBit(64)
        @Expect(ii.toString(radix: 16), "EFFFFFFFFFFFFFFFF")
        i = BigInt(-5)
        ii = i.clearBit(0)
        @Expect(ii.toString(radix: 16), "-6")
        ii = i.clearBit(3)
        @Expect(ii.toString(), "-13")
        ii = i.clearBit(64)
        @Expect(ii.toString(radix: 16), "-10000000000000005")
        i = BigInt.parse("-10000000000000000", radix: 16)
        ii = i.clearBit(64)
        @Expect(ii.toString(radix: 16), "-20000000000000000")
        ii = i.clearBit(0)
        @Expect(ii.toString(radix: 16), "-10000000000000000")
        ii = i.clearBit(97)
        @Expect(ii.toString(radix: 16), "-2000000010000000000000000")
        i = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        ii = i.clearBit(2)
        @Expect(ii.toString(radix: 16), "-FFFFFFFFFFFFFFFF")
        ii = i.clearBit(0)
        @Expect(ii.toString(radix: 16), "-10000000000000000")
        i = BigInt.parse("-FFFFFFFFFFFFFFFFF", radix: 16)
        ii = i.clearBit(0)
        @Expect(ii.toString(radix: 16), "-100000000000000000")
        i = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        ii = i.clearBit(0)
        @Expect(ii.toString(radix: 16), "-1000000000000000000000000")
        i = BigInt.parse("-888800000000000000", radix: 16)
        ii = i.clearBit(66)
        @Expect(ii.toString(radix: 16), "-8C8800000000000000")
    }

    @TestCase
    func flipBitTest() {
        var i = BigInt(0)
        try {
            i.setBit(-1)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The index must >= 0.")
        }
        var ii = i.flipBit(1)
        @Expect(ii.toString(), "2")
        ii = i.flipBit(0)
        @Expect(ii.toString(), "1")
        ii = i.flipBit(64)
        @Expect(ii.toString(), "18446744073709551616")

        i = BigInt(5)
        ii = i.flipBit(1)
        @Expect(ii.toString(), "7")
        ii = i.flipBit(2)
        @Expect(ii.toString(), "1")
        ii = i.flipBit(64)
        @Expect(ii.toString(), "18446744073709551621")

        i = BigInt.parse("10000000000000000", radix: 16)
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16), "10000000000000001")
        ii = i.flipBit(65)
        @Expect(ii.toString(radix: 16), "30000000000000000")
        ii = i.flipBit(96)
        @Expect(ii.toString(radix: 16), "1000000010000000000000000")

        i = BigInt.parse("ffff", radix: 16)
        ii = i.flipBit(16)
        @Expect(ii.toString(radix: 16), "1FFFF")
        ii = i.flipBit(64)
        @Expect(ii.toString(radix: 16), "1000000000000FFFF")
        ii = i.flipBit(15)
        @Expect(ii.toString(radix: 16), "7FFF")
        i = BigInt.parse("fffffffffffffffff", radix: 16)
        ii = i.flipBit(64)
        @Expect(ii.toString(radix: 16), "EFFFFFFFFFFFFFFFF")

        i = BigInt(-5)
        ii = i.flipBit(1)
        @Expect(ii.toString(), "-7")
        ii = i.flipBit(2)
        @Expect(ii.toString(), "-1")
        ii = i.flipBit(64)
        @Expect(ii.toString(radix: 16), "-10000000000000005")
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16), "-6")
        ii = i.flipBit(3)
        @Expect(ii.toString(), "-13")

        i = BigInt.parse("-fffff0000", radix: 16)
        ii = i.flipBit(33)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-dffff0000")

        i = BigInt.parse("-1000000000000000000000000000", radix: 16)
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-fffffffffffffffffffffffffff")
        ii = i.flipBit(64)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-fffffffffff0000000000000000")

        i = BigInt.parse("-10000000000000000", radix: 16)
        ii = i.flipBit(64)
        @Expect(ii.toString(radix: 16), "-20000000000000000")
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-ffffffffffffffff")
        ii = i.flipBit(97)
        @Expect(ii.toString(radix: 16), "-2000000010000000000000000")

        i = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        ii = i.flipBit(2)
        @Expect(ii.toString(radix: 16), "-FFFFFFFFFFFFFFFB")
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16), "-10000000000000000")

        i = BigInt.parse("-FFFFFFFFFFFFFFFFF", radix: 16)
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16), "-100000000000000000")

        i = BigInt.parse("-FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        ii = i.flipBit(0)
        @Expect(ii.toString(radix: 16), "-1000000000000000000000000")

        i = BigInt.parse("-888800000000000000", radix: 16)
        ii = i.flipBit(66)
        @Expect(ii.toString(radix: 16), "-8C8800000000000000")
    }

    @TestCase
    func countOnes() {
        var i = BigInt("0")
        @Expect(countOnes(i), 0)

        i = BigInt("128")
        @Expect(countOnes(i), 1)
        i = BigInt("-128")
        @Expect(countOnes(i), 1)

        i = BigInt.parse("10000000000000000", radix: 16)
        @Expect(countOnes(i), 1)
        i = BigInt.parse("-10000000000000000", radix: 16)
        @Expect(countOnes(i), 1)

        i = BigInt.parse("1000000000000000", radix: 16)
        @Expect(countOnes(i), 1)
        i = BigInt.parse("-1000000000000000", radix: 16)
        @Expect(countOnes(i), 1)

        i = BigInt.parse("FFFFFFFFFFFFFFFF", radix: 16)
        @Expect(countOnes(i), 64)
        i = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        @Expect(countOnes(i), 2)

        i = BigInt.parse("FFFFFFFFFFFFFFFFf", radix: 16)
        @Expect(countOnes(i), 68)
        i = BigInt.parse("-FFFFFFFFFFFFFFFfF", radix: 16)
        @Expect(countOnes(i), 2)
    }

    @TestCase
    func isProbablePrime() {
        var i = BigInt(0)
        @Expect(i.isProbablePrime(0), true)
        @Expect(i.isProbablePrime(1), false)
        i = BigInt(1)
        @Expect(i.isProbablePrime(1), false)
        i = BigInt(2)
        @Expect(i.isProbablePrime(1), true)
        i = BigInt(3)
        @Expect(i.isProbablePrime(1), true)
        i = BigInt(4)
        @Expect(i.isProbablePrime(1), false)
        i = BigInt(5)
        @Expect(i.isProbablePrime(1), true)
        i = BigInt(7)
        @Expect(i.isProbablePrime(1), true)
        i = BigInt("400000000000000000000000000000000002120012")
        @Expect(i.isProbablePrime(1), false)
        // Aimé Ferrier with a mechanical calculator; the largest record not set by computer
        i = BigInt("20988936657440586486151264256610222593863921")
        @Expect(i.isProbablePrime(5), true)
        // J. C. P. Miller & D. J. Wheeler Using Cambridge's EDSAC computer
        i = BigInt("5210644015679228794060694325390955853335898483908056458352183851018372555735221")
        @Expect(i.isProbablePrime(5), true)
        i = BigInt("5210644015679228794060694325390955853335898483908056458352183851018372555735219")
        // very low probability of error
        @Expect(i.isProbablePrime(10), false)
        // Raphael M. Robinson
        i = BigInt(
            "6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151")
        @Expect(i.isProbablePrime(5), true)
        // composite
        i = BigInt(
            "6564797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151")
        @Expect(i.isProbablePrime(10), false)
        // Raphael M. Robinson
        i = BigInt(
            "531137992816767098689588206552468627329593117727031923199444138200403559860852242739162502265229285668889329486246501015346579337652707239409519978766587351943831270835393219031728127")
        @Expect(i.isProbablePrime(5), true)
    }
}
