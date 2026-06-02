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
class BigLogicalTest {
    @TestCase
    func andTest() {
        var a = BigInt.parse("-FFFFFFFF0000000000000002", radix: 16)
        var b = BigInt.parse("-ffffffffffffffff", radix: 16)
        var c = a & b
        @Expect(c.toString(radix: 16), "-1000000000000000000000000")
        c = b & a
        @Expect(c.toString(radix: 16), "-1000000000000000000000000")
        @Expect(a.toString(radix: 16), "-FFFFFFFF0000000000000002")
        @Expect(b.toString(radix: 16).toAsciiLower(), "-ffffffffffffffff")

        a = BigInt("-1")
        b = BigInt.parse("-wwwwwwwwwwww", radix: 36)
        c = a & b
        @Expect(c.toString(radix: 36).toAsciiLower(), "-wwwwwwwwwwww")
        c = b & a
        @Expect(c.toString(radix: 36).toAsciiLower(), "-wwwwwwwwwwww")

        a = BigInt.parse("wwwwwwwwwwww", radix: 36)
        b = BigInt.parse("-1", radix: 36)
        c = a & b
        @Expect(c.toString(radix: 36).toAsciiLower(), "wwwwwwwwwwww")
        c = b & a
        @Expect(c.toString(radix: 36).toAsciiLower(), "wwwwwwwwwwww")

        a = BigInt.parse("10000000000000000", radix: 16)
        b = BigInt.parse("-fffffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "0")
        c = b & a
        @Expect(c.toString(radix: 16), "0")

        a = BigInt.parse("10000000000000000", radix: 16)
        b = BigInt.parse("-ffffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "10000000000000000")
        c = b & a
        @Expect(c.toString(radix: 16), "10000000000000000")

        a = BigInt.parse("1000000000000000", radix: 16)
        b = BigInt.parse("-ffffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "0")
        c = b & a
        @Expect(c.toString(radix: 16), "0")

        a = BigInt.parse("fffffffffffffff", radix: 16)
        b = BigInt.parse("-fffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "1")
        c = b & a
        @Expect(c.toString(radix: 16), "1")
        @Expect(a.toString(radix: 16).toAsciiLower(), "fffffffffffffff")
        @Expect(b.toString(radix: 16).toAsciiLower(), "-fffffffffffffff")

        a = BigInt.parse("fffffffffffffff", radix: 16)
        b = BigInt.parse("-ffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16).toAsciiLower(), "f00000000000001")
        c = b & a
        @Expect(c.toString(radix: 16).toAsciiLower(), "f00000000000001")

        a = BigInt("1")
        b = BigInt.parse("ffffffffffffffffffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "1")
        c = b & a
        @Expect(c.toString(radix: 16), "1")
        @Expect(a.toString(radix: 16).toAsciiLower(), "1")
        @Expect(b.toString(radix: 16).toAsciiLower(), "ffffffffffffffffffffffffffffff")

        a = BigInt("0")
        b = BigInt.parse("-ffffffffffffffffffffffffffffff", radix: 16)
        c = a & b
        @Expect(c.toString(radix: 16), "0")
        c = b & a
        @Expect(c.toString(radix: 16), "0")
    }

    @TestCase
    func orTest() {
        var a = BigInt.parse("10000000000000001111", radix: 16)
        var b = BigInt.parse("fffffff0000000000000000", radix: 16)
        var c = a | b
        @Expect(c.toString(radix: 16).toAsciiLower(), "fffffff0000000000001111")
        c = b | a
        @Expect(c.toString(radix: 16).toAsciiLower(), "fffffff0000000000001111")
        @Expect(a.toString(radix: 16).toAsciiLower(), "10000000000000001111")
        @Expect(b.toString(radix: 16).toAsciiLower(), "fffffff0000000000000000")

        b = BigInt(0)
        c = a | b
        @Expect(c==a)
        c = b | a
        @Expect(c==a)

        a = BigInt.parse("-10000000000000000", radix: 16)
        b = BigInt.parse("-100000000000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-10000000000000000")
        c = b | a
        @Expect(c.toString(radix: 16), "-10000000000000000")

        b = BigInt(0)
        c = a | b
        @Expect(c==a)
        c = b | a
        @Expect(c==a)

        a = BigInt.parse("-10000000000000000", radix: 16)
        b = BigInt.parse("-10000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-10000000")
        c = b | a
        @Expect(c.toString(radix: 16), "-10000000")

        a = BigInt.parse("-100000000000000000000001", radix: 16)
        b = BigInt.parse("-100000000000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-1")
        c = b | a
        @Expect(c.toString(radix: 16), "-1")

        a = BigInt.parse("-100000000000000000000001", radix: 16)
        b = BigInt.parse("-1000000000000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-100000000000000000000001")
        c = b | a
        @Expect(c.toString(radix: 16), "-100000000000000000000001")

        a = BigInt.parse("-ffffffffffffffff", radix: 16)
        b = BigInt.parse("-1000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16).toAsciiLower(), "-fffffffffffffff")
        c = b | a
        @Expect(c.toString(radix: 16).toAsciiLower(), "-fffffffffffffff")
        @Expect(a.toString(radix: 16).toAsciiLower(), "-ffffffffffffffff")
        @Expect(b.toString(radix: 16).toAsciiLower(), "-1000000000000000")

        a = BigInt.parse("10000000000000000", radix: 16)
        b = BigInt.parse("-10000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-10000000000000000")
        c = b | a
        @Expect(c.toString(radix: 16), "-10000000000000000")

        a = BigInt.parse("ffffffffffffffff", radix: 16)
        b = BigInt.parse("-10000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16), "-1")
        c = b | a
        @Expect(c.toString(radix: 16), "-1")

        a = BigInt.parse("-ffffffffffffffffffff", radix: 16)
        b = BigInt.parse("1000000000000000000", radix: 16)
        c = a | b
        @Expect(c.toString(radix: 16).toAsciiLower(), "-feffffffffffffffffff")
        c = b | a
        @Expect(c.toString(radix: 16).toAsciiLower(), "-feffffffffffffffffff")
        @Expect(a.toString(radix: 16).toAsciiLower(), "-ffffffffffffffffffff")
        @Expect(b.toString(radix: 16).toAsciiLower(), "1000000000000000000")

        a = BigInt("-89384947197519843143")
        b = BigInt("84719751984444444444543143")
        c = a | b
        @Expect(c.toString(), "-74387088917550761793")
        c = b | a
        @Expect(c.toString(), "-74387088917550761793")

        a = BigInt("-89384947197519843143")
        b = BigInt("-84719751984444444444543143")
        c = a | b
        @Expect(c.toString(), "-14997858279969081351")
        c = b | a
        @Expect(c.toString(), "-14997858279969081351")
    }

    @TestCase
    func notTest() {
        var a = BigInt.parse("0", radix: 16)
        var b = !a
        @Expect(b.toString(), "-1")

        a = BigInt.parse("FFFFFFFFFFFFFFFF", radix: 16)
        b = !a
        @Expect(b.toString(radix: 16), "-10000000000000000")
        var c = !b
        @Expect(c==a)

        a = BigInt.parse("FFFFFFFFFFFFFFFFffffffff", radix: 16)
        b = !a
        @Expect(b.toString(radix: 16), "-1000000000000000000000000")
        c = !b
        @Expect(c==a)

        a = BigInt.parse("ffff", radix: 16)
        b = !a
        @Expect(b.toString(radix: 16), "-10000")
        c = !b
        @Expect(c==a)

        a = BigInt("-0")
        b = !a
        @Expect(b==BigInt("-1"))
        @Expect(a==!b)
    }

    @TestCase
    func xorTest() {
        var i = BigInt.parse("-feefefefefefeac122223334434343", radix: 16)
        var ii = BigInt.parse("-feefefefefefeac122223334434343", radix: 16)
        @Expect((i^ii).toString(), "0")

        i = BigInt.parse("feefefefefefeac122223334434343", radix: 16)
        ii = BigInt.parse("feefefefefefeac122223334434343", radix: 16)
        @Expect((i^ii).toString(), "0")

        i = BigInt.parse("-13243445255425252555555222523", radix: 10)
        ii = BigInt.parse("1222233344424525252425525234343", radix: 10)
        @Expect((i^ii).toString(), "-1210692066742861255480196872542")

        i = BigInt.parse("FFFFFFFFFFFFFFFF", radix: 16)
        ii = BigInt.parse("-1", radix: 16)
        @Expect((i^ii).toString(radix: 16), "-10000000000000000")
        @Expect((ii^i).toString(radix: 16), "-10000000000000000")
        @Expect(((-i)^(-ii)).toString(radix: 16), "-10000000000000000")

        i = BigInt.parse("FFFFFFFFFFFFFFFF", radix: 16)
        ii = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        @Expect((i^ii).toString(radix: 16), "-2")
        @Expect((ii^i).toString(radix: 16), "-2")

        i = BigInt.parse("FFFFFFFFFFFFFFFFFFFFFFFF", radix: 16)
        ii = BigInt.parse("-1", radix: 16)
        @Expect((i^ii).toString(radix: 16), "-1000000000000000000000000")
        @Expect(((-i)^(-ii)).toString(radix: 16), "-1000000000000000000000000")
        @Expect((ii^i).toString(radix: 16), "-1000000000000000000000000")
        @Expect(((-ii)^(-i)).toString(radix: 16), "-1000000000000000000000000")

        i = BigInt.parse("FFFFFFFFFFFFFFFF", radix: 16)
        ii = BigInt.parse("-10000000000000001", radix: 16)
        @Expect((i^ii).toString(radix: 16), "-20000000000000000")
        @Expect(((-i)^(-ii)).toString(radix: 16), "-20000000000000000")
        @Expect((ii^i).toString(radix: 16), "-20000000000000000")
        @Expect(((-ii)^(-i)).toString(radix: 16), "-20000000000000000")

        i = BigInt.parse("-FFFFFFFFFFFFFFFF", radix: 16)
        ii = BigInt.parse("FFFFFFFF0000000000000001", radix: 16)
        @Expect((i^ii).toString(radix: 16), "-1000000000000000000000000")
        @Expect(((-i)^(-ii)).toString(radix: 16), "-1000000000000000000000000")
        @Expect((ii^i).toString(radix: 16), "-1000000000000000000000000")
        @Expect(((-ii)^(-i)).toString(radix: 16), "-1000000000000000000000000")
        ii = BigInt(0)
        @Expect((i^ii).toString(radix: 16), "-FFFFFFFFFFFFFFFF")

        i = BigInt.parse("-10000000000000000", radix: 16)
        ii = BigInt.parse("-1111111111111111111", radix: 16)
        @Expect((i^ii).toString(radix: 16).toAsciiLower(), "111eeeeeeeeeeeeeeef")
        @Expect(((-i)^(-ii)).toString(radix: 16).toAsciiLower(), "1101111111111111111")
        @Expect((ii^i).toString(radix: 16).toAsciiLower(), "111eeeeeeeeeeeeeeef")
        @Expect(((-ii)^(-i)).toString(radix: 16).toAsciiLower(), "1101111111111111111")

        i = BigInt.parse("10000000000000000", radix: 16)
        ii = BigInt.parse("-10000000000000000", radix: 16)
        @Expect((i^ii).toString(radix: 16).toAsciiLower(), "-20000000000000000")
        @Expect(((-i)^(-ii)).toString(radix: 16).toAsciiLower(), "-20000000000000000")

        ii = BigInt(0)
        @Expect((i^ii).toString(radix: 16).toAsciiLower(), "10000000000000000")
    }

    @TestCase
    func shiftLeftTest() {
        var i = BigInt.parse("123456789ABCDEFFEDCBA9876543210", radix: 16)
        try {
            i << -1
            @Expect(1, 2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The parameter n must >= 0.")
        }
        var ii = i << 0
        @Expect(ii.toString(radix: 16), "123456789ABCDEFFEDCBA9876543210")
        ii = i << 2
        @Expect(ii.toString(radix: 16).toAsciiLower(), "48d159e26af37bffb72ea61d950c840")
        ii = i << 12
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba9876543210000")
        ii = i << 31
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7ff6e5d4c3b2a190800000000")
        ii = i << 32
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba987654321000000000")
        ii = i << 33
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bdffdb97530eca8642000000000")
        ii = i << 63
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7ff6e5d4c3b2a19080000000000000000")
        ii = i << 64
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba98765432100000000000000000")
        ii = i << 65
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bdffdb97530eca864200000000000000000")
        ii = i << 95
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7ff6e5d4c3b2a1908000000000000000000000000")
        ii = i << 96
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba9876543210000000000000000000000000")
        ii = i << 97
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bdffdb97530eca86420000000000000000000000000")

        i = BigInt.parse("-123456789ABCDEFFEDCBA9876543210", radix: 16)
        ii = i << 97
        @Expect(ii.toString(radix: 16).toAsciiLower(), "-2468acf13579bdffdb97530eca86420000000000000000000000000")

        i = BigInt.parse("-10", radix: 16)
        ii = i << 36
        @Expect(ii.toString(radix: 16), "-10000000000")
        ii = i << 64
        @Expect(ii.toString(radix: 16), "-100000000000000000")
        ii = i << 32
        @Expect(ii.toString(radix: 16), "-1000000000")
        ii = i << 30
        @Expect(ii.toString(radix: 16), "-400000000")
        ii = i << 0
        @Expect(ii.toString(radix: 16), "-10")
        ii = i << 56
        @Expect(ii.toString(radix: 16), "-1000000000000000")

        i = BigInt.parse("-1234567890", radix: 16)
        ii = i << 36
        @Expect(ii.toString(radix: 16), "-1234567890000000000")
        ii = i << 64
        @Expect(ii.toString(radix: 16), "-12345678900000000000000000")
        ii = i << 32
        @Expect(ii.toString(radix: 16), "-123456789000000000")
        ii = i << 30
        @Expect(ii.toString(radix: 16), "-48D159E2400000000")
        ii = i << 0
        @Expect(ii.toString(radix: 16), "-1234567890")
        ii = i << 2
        @Expect(ii.toString(radix: 16), "-48D159E240")

        i = BigInt("0")
        ii = i << 1000
        @Expect(ii.toString(), "0")
    }

    @TestCase
    func shiftRightTest() {
        var i = BigInt.parse("123456789ABCDEFFEDCBA9876543210", radix: 16)
        try {
            i >> -1
            @Expect(1, 2)
        } catch (e: ArithmeticException) {
            @Expect(e.message, "The parameter n must >= 0.")
        }
        var ii = i >> 0
        @Expect(ii.toString(radix: 16), "123456789ABCDEFFEDCBA9876543210")
        ii = i >> 2
        @Expect(ii.toString(radix: 16).toAsciiLower(), "48d159e26af37bffb72ea61d950c84")
        ii = i >> 12
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba9876543")
        ii = i >> 31
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bdffdb97530")
        ii = i >> 32
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedcba98")
        ii = i >> 33
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7ff6e5d4c")
        ii = i >> 63
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bdf")
        ii = i >> 64
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdef")
        ii = i >> 65
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7")
        ii = i >> 95
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf")
        ii = i >> 96
        @Expect(ii.toString(radix: 16).toAsciiLower(), "1234567")
        ii = i >> 97
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3")

        i = BigInt.parse("123456789ABCDEFFEDCBA9", radix: 16)
        ii = i >> 2
        @Expect(ii.toString(radix: 16).toAsciiLower(), "48d159e26af37bffb72ea")
        ii = i >> 12
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdeffedc")
        ii = i >> 31
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468acf13579bd")
        ii = i >> 32
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcde")
        ii = i >> 33
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f")
        ii = i >> 63
        @Expect(ii.toString(radix: 16).toAsciiLower(), "2468ac")
        ii = i >> 64
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456")
        ii = i >> 65
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b")
        ii = i >> 95
        @Expect(ii.toString(radix: 16).toAsciiLower(), "0")
        ii = i >> 96
        @Expect(ii.toString(radix: 16).toAsciiLower(), "0")
        ii = i >> 97
        @Expect(ii.toString(radix: 16).toAsciiLower(), "0")

        i = BigInt.parse("12345678901234", radix: 16)
        ii = i >> 32
        @Expect(ii.toString(radix: 16), "123456")
        ii = i >> 64
        @Expect(ii.toString(radix: 16), "0")
        ii = i >> 30
        @Expect(ii.toString(radix: 16), "48D159")
        ii = i >> 0
        @Expect(ii.toString(radix: 16), "12345678901234")
        ii = i >> 52
        @Expect(ii.toString(radix: 16), "1")

        i = BigInt.parse("12345678901234567890", radix: 16)
        ii = i >> 64
        @Expect(ii.toString(radix: 16), "1234")

        ii = i >> 16
        @Expect(ii.toString(radix: 16), "1234567890123456")

        i = BigInt("0")
        ii = i >> 1000
        @Expect(ii.toString(), "0")

        i = BigInt.parse("123456789ABCDEF123456789A", radix: 16)
        ii = i >> 33
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f789")
        ii = i >> 32
        @Expect(ii.toString(radix: 16).toAsciiLower(), "123456789abcdef12")
        ii = i >> 1
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4d5e6f7891a2b3c4d")
        ii = i >> 65
        @Expect(ii.toString(radix: 16).toAsciiLower(), "91a2b3c4")

        i = BigInt.parse("-123456789ABCDEF123456789A", radix: 16)
        ii = i >> 60
        @Expect(ii.toString(radix: 16), "-123456789B")

        i = BigInt.parse("-100000000000000000", radix: 16)
        ii = i >> 32
        @Expect(ii.toString(radix: 16), "-1000000000")

        i = BigInt.parse("-10000000000000000", radix: 16)
        ii = i >> 32
        @Expect(ii.toString(radix: 16), "-100000000")

        i = BigInt.parse("-100000000000000000", radix: 16)
        ii = i >> 36
        @Expect(ii.toString(radix: 16), "-100000000")
    }
}
