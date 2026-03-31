/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.stream.*
import std.io.*
import std.math.*

var isNative64 = if ((UInt64(!UIntNative(0))) == UInt64.Max) {
    true
} else {
    false
}

@Test
public class JsonNumberTest {
    @TestCase
    func jsonnumberIntMax(): Unit {
        let jsonStr = ##"[9223372036854775807, 1844674407370955162]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 9223372036854775807)
        @Expect(reader.readValue<Int64>(), 1844674407370955162)
    }

    @TestCase
    func jsonnumberIntMin(): Unit {
        let jsonStr = ##"-9223372036854775808"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), -9223372036854775808)
    }

    @TestCase
    func jsonnumberUintMax(): Unit {
        let jsonStr = ##"18446744073709551615"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let num: UInt64 = 18446744073709551615
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<UInt64>(), num)
    }

    @TestCase
    func jsonnumberIntOption(): Unit {
        let jsonStr = ##"123"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Option<Int64>>(), 123)
    }

    @TestCase
    func jsonnumberIntZero1(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 0)
    }

    @TestCase
    func jsonnumberIntZero2(): Unit {
        let jsonStr = ##"-0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 0)
    }

    @TestCase
    func jsonnumberIntBinary(): Unit {
        let jsonStr = ##"[0b11, -0B11]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 3)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), -3)
        reader.endArray()
    }

    @TestCase
    func jsonnumberIntBinaryError(): Unit {
        let jsonStr = ##"0b12"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 1)
    }

    @TestCase
    func jsonnumberIntOctal(): Unit {
        let jsonStr = ##"[0o17, -0O17]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 15)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), -15)
        reader.endArray()
    }

    @TestCase
    func jsonnumberIntOctalError(): Unit {
        let jsonStr = ##"0o18"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 1)
    }

    @TestCase
    func jsonnumberIntHex(): Unit {
        let jsonStr = ##"[0x1f, -0X1f]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 31)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), -31)
        reader.endArray()
    }

    @TestCase
    func jsonnumberIntHexError(): Unit {
        let jsonStr = ##"0x1g"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 1)
    }

    @TestCase
    func jsonnumberFloat1(): Unit {
        let jsonStr = ##"123"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 123.0)
    }

    @TestCase
    func jsonnumberFloat2(): Unit {
        let jsonStr = ##"-123.456"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), -123.456)
    }

    @TestCase
    func jsonnumberFloat3(): Unit {
        let jsonStr = ##"123.456e3"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 123456.0)
    }

    @TestCase
    func jsonnumberFloat4(): Unit {
        let jsonStr = ##"123.456E-3"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>().toString(), "0.123456")
    }

    @TestCase
    @Skip
    func jsonnumberFloatMax(): Unit {
        let jsonStr = ##"1.8e309"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), Float64.Inf)
    }

    @TestCase
    @Skip
    func jsonnumberFloatMin(): Unit {
        let jsonStr = ##"-2.5e308"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), -Float64.Inf)
    }

    @TestCase
    func jsonnumberFloatZero1(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 0.0)
    }

    @TestCase
    func jsonnumberFloatZero2(): Unit {
        let jsonStr = ##"-0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 0.0)
    }

    @TestCase
    func jsonnumberFloatInf1(): Unit {
        let jsonStr = ##"1e1333"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Float64>()
            @Assert(false)
        } catch (_: IllegalStateException) {
            return
        }
    }

    @TestCase
    func jsonnumberFloatInf2(): Unit {
        let jsonStr = ##"-1e1333"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Float64>()
            @Assert(false)
        } catch (_: IllegalStateException) {
            return
        }
    }

    @TestCase
    func jsonnumberError1(): Unit {
        let jsonStr = ##"1..1"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Float64>()
            return
        } catch (e: IllegalStateException) {
            return
        }
    }

    @TestCase
    func jsonnumberError2(): Unit {
        let jsonStr = ##"100e100000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 100)
    }

    @TestCase
    func jsonnumberError3(): Unit {
        let jsonStr = ##"-100e100000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<UInt64>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for UInt64.")
        }
    }

    @TestCase
    func jsonstringLongNumber(): Unit {
        var jsonStr = ##""##
        for (_ in 0..2000) {
            jsonStr += ##" "##
        }
        for (_ in 0..2000) {
            jsonStr += ##"1"##
        }
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int64>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(true)
        }
    }

    @TestCase
    func jsonnumberInt32Max(): Unit {
        let jsonStr = ##"2147483647"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int32>(), Int32(2147483647))
    }

    @TestCase
    func jsonnumberInt32Min(): Unit {
        let jsonStr = ##"-2147483648"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int32>(), Int32(-2147483648))
    }

    @TestCase
    func jsonnumberInt32Overflow(): Unit {
        let jsonStr = ##"2147483648"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int32>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int32.")
        }
    }

    @TestCase
    func jsonnumberInt32Underflow(): Unit {
        let jsonStr = ##"-2147483649"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int32>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int32.")
        }
    }

    @TestCase
    func jsonnumberInt16Max(): Unit {
        let jsonStr = ##"32767"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int16>(), Int16(32767))
    }

    @TestCase
    func jsonnumberInt16Min(): Unit {
        let jsonStr = ##"-32768"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int16>(), Int16(-32768))
    }

    @TestCase
    func jsonnumberInt16Overflow(): Unit {
        let jsonStr = ##"32768"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int16>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int16.")
        }
    }

    @TestCase
    func jsonnumberInt16Underflow(): Unit {
        let jsonStr = ##"-32769"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int16>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int16.")
        }
    }

    @TestCase
    func jsonnumberInt8Max(): Unit {
        let jsonStr = ##"127"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int8>(), Int8(127))
    }

    @TestCase
    func jsonnumberInt8Min(): Unit {
        let jsonStr = ##"-128"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int8>(), Int8(-128))
    }

    @TestCase
    func jsonnumberInt8Overflow(): Unit {
        let jsonStr = ##"128"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int8>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int8.")
        }
    }

    @TestCase
    func jsonnumberInt8Underflow(): Unit {
        let jsonStr = ##"-129"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<Int8>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for Int8.")
        }
    }

    @TestCase
    func jsonnumberIntNativeMax(): Unit {
        if (isNative64) {
            let jsonStr = ##"9223372036854775807"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<IntNative>(), IntNative(9223372036854775807))
        } else {
            let jsonStr = ##"2147483647"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<IntNative>(), IntNative(2147483647))
        }
    }

    @TestCase
    func jsonnumberIntNativeMin(): Unit {
        if (isNative64) {
            let jsonStr = ##"-9223372036854775808"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<IntNative>(), IntNative(-9223372036854775808))
        } else {
            let jsonStr = ##"-2147483648"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<IntNative>(), IntNative(-2147483648))
        }
    }

    @TestCase
    func jsonnumberIntNativeOverflow(): Unit {
        if (!isNative64) {
            let jsonStr = ##"2147483648"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            try {
                reader.readValue<IntNative>()
                @Expect(false)
            } catch (e: OverflowException) {
                @Expect(e.message, "The next number is out of range for IntNative.")
            }
        }
    }

    @TestCase
    func jsonnumberIntNativeUnderflow(): Unit {
        if (!isNative64) {
            let jsonStr = ##"-2147483649"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            try {
                reader.readValue<IntNative>()
                @Expect(false)
            } catch (e: OverflowException) {
                @Expect(e.message, "The next number is out of range for IntNative.")
            }
        }
    }

    @TestCase
    func jsonnumberUint32Max(): Unit {
        let jsonStr = ##"4294967295"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let num: UInt32 = 4294967295
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<UInt32>(), num)
    }

    @TestCase
    func jsonnumberUint32Overflow(): Unit {
        let jsonStr = ##"4294967296"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<UInt32>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for UInt32.")
        }
    }

    @TestCase
    func jsonnumberUint16Max(): Unit {
        let jsonStr = ##"65535"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let num: UInt16 = 65535
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<UInt16>(), num)
    }

    @TestCase
    func jsonnumberUint16Overflow(): Unit {
        let jsonStr = ##"65536"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<UInt16>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for UInt16.")
        }
    }

    @TestCase
    func jsonnumberUint8Max(): Unit {
        let jsonStr = ##"255"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let num: UInt8 = 255
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<UInt8>(), num)
    }

    @TestCase
    func jsonnumberUint8Overflow(): Unit {
        let jsonStr = ##"256"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        try {
            reader.readValue<UInt8>()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "The next number is out of range for UInt8.")
        }
    }

    @TestCase
    func jsonnumberUintNativeMax(): Unit {
        if (isNative64) {
            let jsonStr = ##"18446744073709551615"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            let num: UIntNative = 18446744073709551615
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<UIntNative>(), num)
        } else {
            let jsonStr = ##"4294967295"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            let num: UIntNative = 4294967295
            @Expect(reader.peek(), JsonToken.JsonNumber)
            @Expect(reader.readValue<UIntNative>(), num)
        }
    }

    @TestCase
    func jsonnumberUintNativeOverflow(): Unit {
        if (!isNative64) {
            let jsonStr = ##"4294967296"##
            var bas = ByteBuffer()
            unsafe { bas.write(jsonStr.rawData()) }
            var reader = JsonReader(bas)
            @Expect(reader.peek(), JsonToken.JsonNumber)
            try {
                reader.readValue<UIntNative>()
                @Expect(false)
            } catch (e: OverflowException) {
                @Expect(e.message, "The next number is out of range for UIntNative.")
            }
        }
    }

    @TestCase
    func jsonnumberFloat32(): Unit {
        let jsonStr = ##"-123.456"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float32>(), Float32(-123.456))
    }

    @TestCase
    func jsonnumberFloat16(): Unit {
        let jsonStr = ##"-123.456"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float16>(), Float16(-123.456))
    }
}
