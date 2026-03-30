/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.time.*
import std.math.*

@Test
class AppendTest {
    static const str = "一1a①🌞"
    let sb = StringBuilder()
    @TestCase
    func testAppendRune(): Unit {
        sb.reset()
        sb.append('一')
        sb.append('1')
        sb.append('a')
        sb.append('①')
        sb.append('🌞')
        @Expect(sb.toString(), str)
    }

    @TestCase
    func testAppendString(): Unit {
        sb.reset()
        sb.append(str)
        @Expect(sb.toString(), str)
    }

    @TestCase
    func testAppendStringBuilder(): Unit {
        sb.reset()
        sb.append(StringBuilder(str))
        @Expect(sb.toString(),str)
    }

    @TestCase
    func testAppendRuneArray(): Unit {
        let runeArr = str.toRuneArray()
        sb.reset()
        sb.append(runeArr)
        @Expect(sb.toString(), str)
    }

    @TestCase
    func testAppendCString(): Unit {
        let cs = unsafe { LibC.mallocCString(str) }
        sb.reset()
        sb.append(cs)
        unsafe { LibC.free(cs) }
        @Expect(sb.toString(), str)
    }

    @TestCase
    func appendTemplate(): Unit {
        let dateTime = DateTime.now()
        sb.reset()
        sb.append(dateTime)
        @Expect(sb.toString(), dateTime.toString())
    }

    @TestCase
    func appendTArray(): Unit {
        let arrayT = Array<Int64>(10, {i => i})
        sb.reset()
        sb.append(arrayT)
        @Expect(sb.toString(), "0123456789")
    }

    @TestCase
    func appendTBool(): Unit {
        sb.reset()
        sb.append(true)
        sb.append(' ')
        sb.append(false)
        @Expect(sb.toString(), "true false")
    }

    @TestCase
    func appendInteger(): Unit {
        sb.reset()
        sb.append(0)
        sb.append(Int32(1))
        sb.append(Int16(2))
        sb.append(Int8(3))
        sb.append(UInt64(4))
        sb.append(UInt32(5))
        sb.append(UInt16(6))
        sb.append(UInt8(7))
        @Expect(sb.toString(), "01234567")
        @Expect(sb.size, 8)

        sb.reset()
        sb.append(11)
        @Expect(sb.size, 2)
        sb.append(-222)
        @Expect(sb.size, 6)
        sb.append(Int64.Min)
        @Expect(sb.size, 26)
        @Expect(sb.toString(), "11-222-9223372036854775808")
        sb.append(Int64.Max)
        @Expect(sb.size, 45)
        @Expect(sb.toString(), "11-222-92233720368547758089223372036854775807")

        sb.reset()
        sb.append(UInt64(0))
        sb.append(UInt64(114514))
        @Expect(sb.size, 7)
        sb.append(UInt64.Max)
        @Expect(sb.size, 27)
        @Expect(sb.toString(), "011451418446744073709551615")
    }

    @TestCase
    func appendFloat(): Unit {
        sb.reset()
        let float1 = Float64(9876543210.0123456789)
        sb.append(float1)
        @Expect(sb.size, 17)
        @Expect(sb.toString(), float1.toString())

        let float2 = Float32(9876543210.0123456789)
        sb.reset()
        sb.append(float2)
        @Expect(sb.size, 17)
        @Expect(sb.toString(), float2.toString())

        let float3 = Float16(123.123456789)
        sb.reset()
        sb.append(float3)
        @Expect(sb.size, 10)
        @Expect(sb.toString(), float3.toString())

        sb.reset()
        sb.append(Float64.NaN)
        @Expect(sb.size, 3)
        @Expect(sb.toString(), "nan")

        sb.reset()
        sb.append(Float64.Inf)
        @Expect(sb.size, 3)
        @Expect(sb.toString(), "inf")
    }

    @TestCase
    func appendByteArray(): Unit {
        var byteArr: Array<Byte> = unsafe { str.rawData() }
        sb.reset()
        sb.appendFromUtf8(byteArr)
        @Expect(sb.toString(), str)

        sb.reset()
        byteArr = [129, 198]
        try {
            sb.appendFromUtf8(byteArr)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid utf8 byte sequence.")
        }
    }

    @TestCase
    func appendByteArrayUnchecked(): Unit {
        var byteArr: Array<Byte> = unsafe { str.rawData() }
        sb.reset()
        unsafe { sb.appendFromUtf8Unchecked(byteArr) }
        @Expect(sb.toString(), str)

        sb.reset()
        byteArr = [129, 198]
        unsafe { sb.appendFromUtf8Unchecked(byteArr) }
    }

    @TestCase
    func appendDoNotImpactToString(): Unit {
        sb.reset()
        sb.append(str)
        let res = sb.toString()
        sb.reset()
        sb.append("123456")
        @Expect(res, str)
    }

    @TestCase
    func appendInt64Min(): Unit {
        sb.reset()
        sb.append(Int64.Min)
        @Expect(sb.toString(), "-9223372036854775808")
        @Expect(sb.size, 20)
    }

    @TestCase
    func appendInt64Max(): Unit {
        sb.reset()
        sb.append(Int64.Max)
        @Expect(sb.toString(), "9223372036854775807")
        @Expect(sb.size, 19)
    }

    @TestCase
    func appendUInt64Max(): Unit {
        sb.reset()
        sb.append(UInt64.Max)
        @Expect(sb.toString(), "18446744073709551615")
        @Expect(sb.size, 20)
    }
}
