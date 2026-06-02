// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 0

class Main {
    public static func assertByteEquals(expected: Int8, result: Int8): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertShortEquals(expected: Int16, result: Int16): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertIntEquals(expected: Int32, result: Int32): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertLongEquals(expected: Int64, result: Int64): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertRuneEquals(expected: Rune, result: Rune): Unit {
        if (expected != result) {
            // Values are cast to int to display numeric values instead of
            // (UTF-16 encoded) characters.
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertFloatEquals(expected: Float32, result: Float32): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func assertDoubleEquals(expected: Float64, result: Float64): Unit {
        if (expected != result) {
            throw Exception("Expected: " + expected.toString() + ", found: " + result.toString())
        }
    }

    public static func byteToLong(): Unit {
        assertLongEquals(1, opt_noinline_ByteToLong(Int8(1)))
        assertLongEquals(0, opt_noinline_ByteToLong(Int8(0)))
        assertLongEquals(-1, opt_noinline_ByteToLong(Int8(-1)))
        assertLongEquals(51, opt_noinline_ByteToLong(Int8(51)))
        assertLongEquals(-51, opt_noinline_ByteToLong(Int8(-51)))
        assertLongEquals(127, opt_noinline_ByteToLong(Int8(127))) // 2^7 - 1
        assertLongEquals(-127, opt_noinline_ByteToLong(Int8(-127))) // -(2^7 - 1)
        assertLongEquals(-128, opt_noinline_ByteToLong(Int8(-128))) // -(2^7)
    }

    public static func shortToLong(): Unit {
        assertLongEquals(1, opt_noinline_ShortToLong(Int16(1)))
        assertLongEquals(0, opt_noinline_ShortToLong(Int16(0)))
        assertLongEquals(-1, opt_noinline_ShortToLong(Int16(-1)))
        assertLongEquals(51, opt_noinline_ShortToLong(Int16(51)))
        assertLongEquals(-51, opt_noinline_ShortToLong(Int16(-51)))
        assertLongEquals(32767, opt_noinline_ShortToLong(Int16(32767))) // 2^15 - 1
        assertLongEquals(-32767, opt_noinline_ShortToLong(Int16(-32767))) // -(2^15 - 1)
        assertLongEquals(-32768, opt_noinline_ShortToLong(Int16(-32768))) // -(2^15)
    }

    public static func intToLong(): Unit {
        assertLongEquals(1, opt_noinline_IntToLong(1))
        assertLongEquals(0, opt_noinline_IntToLong(0))
        assertLongEquals(-1, opt_noinline_IntToLong(-1))
        assertLongEquals(51, opt_noinline_IntToLong(51))
        assertLongEquals(-51, opt_noinline_IntToLong(-51))
        assertLongEquals(2147483647, opt_noinline_IntToLong(2147483647)) // 2^31 - 1
        assertLongEquals(-2147483647, opt_noinline_IntToLong(-2147483647)) // -(2^31 - 1)
        assertLongEquals(-2147483648, opt_noinline_IntToLong(-2147483648)) // -(2^31)
    }

    public static func byteToFloat(): Unit {
        assertFloatEquals(1.0, opt_noinline_ByteToFloat(Int8(1)))
        assertFloatEquals(0.0, opt_noinline_ByteToFloat(Int8(0)))
        assertFloatEquals(-1.0, opt_noinline_ByteToFloat(Int8(-1)))
        assertFloatEquals(51.0, opt_noinline_ByteToFloat(Int8(51)))
        assertFloatEquals(-51.0, opt_noinline_ByteToFloat(Int8(-51)))
        assertFloatEquals(127.0, opt_noinline_ByteToFloat(Int8(127))) // 2^7 - 1
        assertFloatEquals(-127.0, opt_noinline_ByteToFloat(Int8(-127))) // -(2^7 - 1)
        assertFloatEquals(-128.0, opt_noinline_ByteToFloat(Int8(-128))) // -(2^7)
    }

    public static func shortToFloat(): Unit {
        assertFloatEquals(1.0, opt_noinline_ShortToFloat(Int16(1)))
        assertFloatEquals(0.0, opt_noinline_ShortToFloat(Int16(0)))
        assertFloatEquals(-1.0, opt_noinline_ShortToFloat(Int16(-1)))
        assertFloatEquals(51.0, opt_noinline_ShortToFloat(Int16(51)))
        assertFloatEquals(-51.0, opt_noinline_ShortToFloat(Int16(-51)))
        assertFloatEquals(32767.0, opt_noinline_ShortToFloat(Int16(32767))) // 2^15 - 1
        assertFloatEquals(-32767.0, opt_noinline_ShortToFloat(Int16(-32767))) // -(2^15 - 1)
        assertFloatEquals(-32768.0, opt_noinline_ShortToFloat(Int16(-32768))) // -(2^15)
    }

    public static func intToFloat(): Unit {
        assertFloatEquals(1.0, opt_noinline_IntToFloat(1))
        assertFloatEquals(0.0, opt_noinline_IntToFloat(0))
        assertFloatEquals(-1.0, opt_noinline_IntToFloat(-1))
        assertFloatEquals(51.0, opt_noinline_IntToFloat(51))
        assertFloatEquals(-51.0, opt_noinline_IntToFloat(-51))
        assertFloatEquals(16777215.0, opt_noinline_IntToFloat(16777215)) // 2^24 - 1
        assertFloatEquals(-16777215.0, opt_noinline_IntToFloat(-16777215)) // -(2^24 - 1)
        assertFloatEquals(16777216.0, opt_noinline_IntToFloat(16777216)) // 2^24
        assertFloatEquals(-16777216.0, opt_noinline_IntToFloat(-16777216)) // -(2^24)
        assertFloatEquals(2147483647.0, opt_noinline_IntToFloat(2147483647)) // 2^31 - 1
        assertFloatEquals(-2147483648.0, opt_noinline_IntToFloat(-2147483648)) // -(2^31)
    }

    public static func byteToDouble(): Unit {
        assertDoubleEquals(1.0, opt_noinline_ByteToDouble(Int8(1)))
        assertDoubleEquals(0.0, opt_noinline_ByteToDouble(Int8(0)))
        assertDoubleEquals(-1.0, opt_noinline_ByteToDouble(Int8(-1)))
        assertDoubleEquals(51.0, opt_noinline_ByteToDouble(Int8(51)))
        assertDoubleEquals(-51.0, opt_noinline_ByteToDouble(Int8(-51)))
        assertDoubleEquals(127.0, opt_noinline_ByteToDouble(Int8(127))) // 2^7 - 1
        assertDoubleEquals(-127.0, opt_noinline_ByteToDouble(Int8(-127))) // -(2^7 - 1)
        assertDoubleEquals(-128.0, opt_noinline_ByteToDouble(Int8(-128))) // -(2^7)
    }

    public static func shortToDouble(): Unit {
        assertDoubleEquals(1.0, opt_noinline_ShortToDouble(Int16(1)))
        assertDoubleEquals(0.0, opt_noinline_ShortToDouble(Int16(0)))
        assertDoubleEquals(-1.0, opt_noinline_ShortToDouble(Int16(-1)))
        assertDoubleEquals(51.0, opt_noinline_ShortToDouble(Int16(51)))
        assertDoubleEquals(-51.0, opt_noinline_ShortToDouble(Int16(-51)))
        assertDoubleEquals(32767.0, opt_noinline_ShortToDouble(Int16(32767))) // 2^15 - 1
        assertDoubleEquals(-32767.0, opt_noinline_ShortToDouble(Int16(-32767))) // -(2^15 - 1)
        assertDoubleEquals(-32768.0, opt_noinline_ShortToDouble(Int16(-32768))) // -(2^15)
    }

    public static func intToDouble(): Unit {
        assertDoubleEquals(1.0, opt_noinline_IntToDouble(1))
        assertDoubleEquals(0.0, opt_noinline_IntToDouble(0))
        assertDoubleEquals(-1.0, opt_noinline_IntToDouble(-1))
        assertDoubleEquals(51.0, opt_noinline_IntToDouble(51))
        assertDoubleEquals(-51.0, opt_noinline_IntToDouble(-51))
        assertDoubleEquals(16777216.0, opt_noinline_IntToDouble(16777216)) // 2^24
        assertDoubleEquals(-16777216.0, opt_noinline_IntToDouble(-16777216)) // -(2^24)
        assertDoubleEquals(2147483647.0, opt_noinline_IntToDouble(2147483647)) // 2^31 - 1
        assertDoubleEquals(-2147483648.0, opt_noinline_IntToDouble(-2147483648)) // -(2^31)
    }

    public static func longToInt(): Unit {
        assertIntEquals(1, opt_noinline_LongToInt(1))
        assertIntEquals(0, opt_noinline_LongToInt(0))
        assertIntEquals(-1, opt_noinline_LongToInt(-1))
        assertIntEquals(51, opt_noinline_LongToInt(51))
        assertIntEquals(-51, opt_noinline_LongToInt(-51))
        assertIntEquals(2147483647, opt_noinline_LongToInt(2147483647)) // 2^31 - 1
        assertIntEquals(-2147483647, opt_noinline_LongToInt(-2147483647)) // -(2^31 - 1)
        assertIntEquals(-2147483648, opt_noinline_LongToInt(-2147483648)) // -(2^31)
        assertIntEquals(-2147483648, opt_noinline_LongToInt(2147483648)) // (2^31)
        assertIntEquals(2147483647, opt_noinline_LongToInt(-2147483649)) // -(2^31 + 1)
        assertIntEquals(-1, opt_noinline_LongToInt(9223372036854775807)) // 2^63 - 1
        assertIntEquals(1, opt_noinline_LongToInt(-9223372036854775807)) // -(2^63 - 1)
        assertIntEquals(0, opt_noinline_LongToInt(-9223372036854775808)) // -(2^63)

        assertIntEquals(42, opt_noinline_LongLiteralToInt())

        // Ensure long-to-int conversions truncates values as expected.
        assertLongEquals(1, opt_noinline_IntToLong(opt_noinline_LongToInt(4294967297))) // 2^32 + 1
        assertLongEquals(0, opt_noinline_IntToLong(opt_noinline_LongToInt(4294967296))) // 2^32
        assertLongEquals(-1, opt_noinline_IntToLong(opt_noinline_LongToInt(4294967295))) // 2^32 - 1
        assertLongEquals(0, opt_noinline_IntToLong(opt_noinline_LongToInt(0)))
        assertLongEquals(1, opt_noinline_IntToLong(opt_noinline_LongToInt(-4294967295))) // -(2^32 - 1)
        assertLongEquals(0, opt_noinline_IntToLong(opt_noinline_LongToInt(-4294967296))) // -(2^32)
        assertLongEquals(-1, opt_noinline_IntToLong(opt_noinline_LongToInt(-4294967297))) // -(2^32 + 1)
    }

    public static func longToFloat(): Unit {
        assertFloatEquals(1.0, opt_noinline_LongToFloat(1))
        assertFloatEquals(0.0, opt_noinline_LongToFloat(0))
        assertFloatEquals(-1.0, opt_noinline_LongToFloat(-1))
        assertFloatEquals(51.0, opt_noinline_LongToFloat(51))
        assertFloatEquals(-51.0, opt_noinline_LongToFloat(-51))
        assertFloatEquals(2147483648.0, opt_noinline_LongToFloat(2147483647)) // 2^31 - 1
        assertFloatEquals(-2147483648.0, opt_noinline_LongToFloat(-2147483647)) // -(2^31 - 1)
        assertFloatEquals(-2147483648.0, opt_noinline_LongToFloat(-2147483648)) // -(2^31)
        assertFloatEquals(2147483648.0, opt_noinline_LongToFloat(2147483648)) // (2^31)
        assertFloatEquals(-2147483648.0, opt_noinline_LongToFloat(-2147483649)) // -(2^31 + 1)
        assertFloatEquals(4294967296.0, opt_noinline_LongToFloat(4294967296)) // (2^32)
        assertFloatEquals(-4294967296.0, opt_noinline_LongToFloat(-4294967296)) // -(2^32)
        assertFloatEquals(140739635838976.0, opt_noinline_LongToFloat(140739635871745)) // 1 + 2^15 + 2^31 + 2^47
        assertFloatEquals(-140739635838976.0, opt_noinline_LongToFloat(-140739635871745)) // -(1 + 2^15 + 2^31 + 2^47)
        assertFloatEquals(9223372036854775808.0, opt_noinline_LongToFloat(9223372036854775807)) // 2^63 - 1
        assertFloatEquals(-9223372036854775808.0, opt_noinline_LongToFloat(-9223372036854775807)) // -(2^63 - 1)
        assertFloatEquals(-9223372036854775808.0, opt_noinline_LongToFloat(-9223372036854775808)) // -(2^63)
    }

    public static func longToDouble(): Unit {
        assertDoubleEquals(1.0, opt_noinline_LongToDouble(1))
        assertDoubleEquals(0.0, opt_noinline_LongToDouble(0))
        assertDoubleEquals(-1.0, opt_noinline_LongToDouble(-1))
        assertDoubleEquals(51.0, opt_noinline_LongToDouble(51))
        assertDoubleEquals(-51.0, opt_noinline_LongToDouble(-51))
        assertDoubleEquals(2147483647.0, opt_noinline_LongToDouble(2147483647)) // 2^31 - 1
        assertDoubleEquals(-2147483647.0, opt_noinline_LongToDouble(-2147483647)) // -(2^31 - 1)
        assertDoubleEquals(-2147483648.0, opt_noinline_LongToDouble(-2147483648)) // -(2^31)
        assertDoubleEquals(2147483648.0, opt_noinline_LongToDouble(2147483648)) // (2^31)
        assertDoubleEquals(-2147483649.0, opt_noinline_LongToDouble(-2147483649)) // -(2^31 + 1)
        assertDoubleEquals(4294967296.0, opt_noinline_LongToDouble(4294967296)) // (2^32)
        assertDoubleEquals(-4294967296.0, opt_noinline_LongToDouble(-4294967296)) // -(2^32)
        assertDoubleEquals(140739635871745.0, opt_noinline_LongToDouble(140739635871745)) // 1 + 2^15 + 2^31 + 2^47
        assertDoubleEquals(-140739635871745.0, opt_noinline_LongToDouble(-140739635871745)) // -(1 + 2^15 + 2^31 + 2^47)
        assertDoubleEquals(9223372036854775808.0, opt_noinline_LongToDouble(9223372036854775807)) // 2^63 - 1
        assertDoubleEquals(-9223372036854775808.0, opt_noinline_LongToDouble(-9223372036854775807)) // -(2^63 - 1)
        assertDoubleEquals(-9223372036854775808.0, opt_noinline_LongToDouble(-9223372036854775808)) // -(2^63)
    }

    public static func floatToInt(): Unit {
        assertIntEquals(1, opt_noinline_FloatToInt(1.0))
        assertIntEquals(0, opt_noinline_FloatToInt(0.0))
        assertIntEquals(0, opt_noinline_FloatToInt(-0.0))
        assertIntEquals(-1, opt_noinline_FloatToInt(-1.0))
        assertIntEquals(51, opt_noinline_FloatToInt(51.0))
        assertIntEquals(-51, opt_noinline_FloatToInt(-51.0))
        assertIntEquals(0, opt_noinline_FloatToInt(0.5))
        assertIntEquals(0, opt_noinline_FloatToInt(0.4999999))
        assertIntEquals(0, opt_noinline_FloatToInt(-0.4999999))
        assertIntEquals(0, opt_noinline_FloatToInt(-0.5))
        assertIntEquals(42, opt_noinline_FloatToInt(42.199))
        assertIntEquals(-42, opt_noinline_FloatToInt(-42.199))
        assertIntEquals(-2147483648, opt_noinline_FloatToInt(-2147483647.0)) // -(2^31 - 1)
        assertIntEquals(-2147483648, opt_noinline_FloatToInt(-2147483648.0)) // -(2^31)
        assertIntEquals(-2147483648, opt_noinline_FloatToInt(-2147483649.0)) // -(2^31 + 1)
    }

    public static func floatToLong(): Unit {
        assertLongEquals(1, opt_noinline_FloatToLong(1.0))
        assertLongEquals(0, opt_noinline_FloatToLong(0.0))
        assertLongEquals(0, opt_noinline_FloatToLong(-0.0))
        assertLongEquals(-1, opt_noinline_FloatToLong(-1.0))
        assertLongEquals(51, opt_noinline_FloatToLong(51.0))
        assertLongEquals(-51, opt_noinline_FloatToLong(-51.0))
        assertLongEquals(0, opt_noinline_FloatToLong(0.5))
        assertLongEquals(0, opt_noinline_FloatToLong(0.4999999))
        assertLongEquals(0, opt_noinline_FloatToLong(-0.4999999))
        assertLongEquals(0, opt_noinline_FloatToLong(-0.5))
        assertLongEquals(42, opt_noinline_FloatToLong(42.199))
        assertLongEquals(-42, opt_noinline_FloatToLong(-42.199))
        assertLongEquals(2147483648, opt_noinline_FloatToLong(2147483647.0)) // 2^31 - 1
        assertLongEquals(-2147483648, opt_noinline_FloatToLong(-2147483647.0)) // -(2^31 - 1)
        assertLongEquals(-2147483648, opt_noinline_FloatToLong(-2147483648.0)) // -(2^31)
        assertLongEquals(2147483648, opt_noinline_FloatToLong(2147483648.0)) // (2^31)
        assertLongEquals(-2147483648, opt_noinline_FloatToLong(-2147483649.0)) // -(2^31 + 1)
        assertLongEquals(-9223372036854775808, opt_noinline_FloatToLong(-9223372036854775807.0)) // -(2^63 - 1)
        assertLongEquals(-9223372036854775808, opt_noinline_FloatToLong(-9223372036854775808.0)) // -(2^63)
        assertLongEquals(9223371487098961920, opt_noinline_FloatToLong(9223371487098961920.0)) // Math.nextAfter(2F^63, 0)
        assertLongEquals(-9223371487098961920, opt_noinline_FloatToLong(-9223371487098961920.0)) // Math.nextAfter(-2F^63, 0)
    }

    public static func floatToDouble(): Unit {
        assertDoubleEquals(1.0, opt_noinline_FloatToDouble(1.0))
        assertDoubleEquals(0.0, opt_noinline_FloatToDouble(0.0))
        assertDoubleEquals(0.0, opt_noinline_FloatToDouble(-0.0))
        assertDoubleEquals(-1.0, opt_noinline_FloatToDouble(-1.0))
        assertDoubleEquals(51.0, opt_noinline_FloatToDouble(51.0))
        assertDoubleEquals(-51.0, opt_noinline_FloatToDouble(-51.0))
        assertDoubleEquals(0.5, opt_noinline_FloatToDouble(0.5))
        assertDoubleEquals(0.5, opt_noinline_FloatToDouble(0.5))
        assertDoubleEquals(-0.5, opt_noinline_FloatToDouble(-0.5))
        assertDoubleEquals(-0.5, opt_noinline_FloatToDouble(-0.5))
        assertDoubleEquals(2147483648.0, opt_noinline_FloatToDouble(2147483647.0)) // 2^31 - 1
        assertDoubleEquals(-2147483648.0, opt_noinline_FloatToDouble(-2147483647.0)) // -(2^31 - 1)
        assertDoubleEquals(-2147483648.0, opt_noinline_FloatToDouble(-2147483648.0)) // -(2^31)
        assertDoubleEquals(2147483648.0, opt_noinline_FloatToDouble(2147483648.0)) // (2^31)
        assertDoubleEquals(-2147483648.0, opt_noinline_FloatToDouble(-2147483649.0)) // -(2^31 + 1)
        assertDoubleEquals(9223372036854775808.0, opt_noinline_FloatToDouble(9223372036854775807.0)) // 2^63 - 1
        assertDoubleEquals(-9223372036854775808.0, opt_noinline_FloatToDouble(-9223372036854775807.0)) // -(2^63 - 1)
        assertDoubleEquals(-9223372036854775808.0, opt_noinline_FloatToDouble(-9223372036854775808.0)) // -(2^63)
    }

    public static func doubleToInt(): Unit {
        assertIntEquals(1, opt_noinline_DoubleToInt(1.0))
        assertIntEquals(0, opt_noinline_DoubleToInt(0.0))
        assertIntEquals(0, opt_noinline_DoubleToInt(-0.0))
        assertIntEquals(-1, opt_noinline_DoubleToInt(-1.0))
        assertIntEquals(51, opt_noinline_DoubleToInt(51.0))
        assertIntEquals(-51, opt_noinline_DoubleToInt(-51.0))
        assertIntEquals(0, opt_noinline_DoubleToInt(0.5))
        assertIntEquals(0, opt_noinline_DoubleToInt(0.4999999))
        assertIntEquals(0, opt_noinline_DoubleToInt(-0.4999999))
        assertIntEquals(0, opt_noinline_DoubleToInt(-0.5))
        assertIntEquals(42, opt_noinline_DoubleToInt(42.199))
        assertIntEquals(-42, opt_noinline_DoubleToInt(-42.199))
        assertIntEquals(2147483647, opt_noinline_DoubleToInt(2147483647.0)) // 2^31 - 1
        assertIntEquals(-2147483647, opt_noinline_DoubleToInt(-2147483647.0)) // -(2^31 - 1)
        assertIntEquals(-2147483648, opt_noinline_DoubleToInt(-2147483648.0)) // -(2^31)
    }

    public static func doubleToLong(): Unit {
        assertLongEquals(1, opt_noinline_DoubleToLong(1.0))
        assertLongEquals(0, opt_noinline_DoubleToLong(0.0))
        assertLongEquals(0, opt_noinline_DoubleToLong(-0.0))
        assertLongEquals(-1, opt_noinline_DoubleToLong(-1.0))
        assertLongEquals(51, opt_noinline_DoubleToLong(51.0))
        assertLongEquals(-51, opt_noinline_DoubleToLong(-51.0))
        assertLongEquals(0, opt_noinline_DoubleToLong(0.5))
        assertLongEquals(0, opt_noinline_DoubleToLong(0.4999999))
        assertLongEquals(0, opt_noinline_DoubleToLong(-0.4999999))
        assertLongEquals(0, opt_noinline_DoubleToLong(-0.5))
        assertLongEquals(42, opt_noinline_DoubleToLong(42.199))
        assertLongEquals(-42, opt_noinline_DoubleToLong(-42.199))
        assertLongEquals(2147483647, opt_noinline_DoubleToLong(2147483647.0)) // 2^31 - 1
        assertLongEquals(-2147483647, opt_noinline_DoubleToLong(-2147483647.0)) // -(2^31 - 1)
        assertLongEquals(-2147483648, opt_noinline_DoubleToLong(-2147483648.0)) // -(2^31)
        assertLongEquals(2147483648, opt_noinline_DoubleToLong(2147483648.0)) // (2^31)
        assertLongEquals(-2147483649, opt_noinline_DoubleToLong(-2147483649.0)) // -(2^31 + 1)
        assertLongEquals(-9223372036854775808, opt_noinline_DoubleToLong(-9223372036854775807.0)) // -(2^63 - 1)
        assertLongEquals(-9223372036854775808, opt_noinline_DoubleToLong(-9223372036854775808.0)) // -(2^63)
        assertLongEquals(9223372036854774784, opt_noinline_DoubleToLong(9223372036854774784.0)) // Math.nextAfter(2D^63, 0)
        assertLongEquals(-9223372036854774784, opt_noinline_DoubleToLong(-9223372036854774784.0)) // Math.nextAfter(-2D^63, 0)
    }

    public static func doubleToFloat(): Unit {
        assertFloatEquals(1.0, opt_noinline_DoubleToFloat(1.0))
        assertFloatEquals(0.0, opt_noinline_DoubleToFloat(0.0))
        assertFloatEquals(0.0, opt_noinline_DoubleToFloat(-0.0))
        assertFloatEquals(-1.0, opt_noinline_DoubleToFloat(-1.0))
        assertFloatEquals(51.0, opt_noinline_DoubleToFloat(51.0))
        assertFloatEquals(-51.0, opt_noinline_DoubleToFloat(-51.0))
        assertFloatEquals(0.5, opt_noinline_DoubleToFloat(0.5))
        assertFloatEquals(0.4999999, opt_noinline_DoubleToFloat(0.4999999))
        assertFloatEquals(-0.4999999, opt_noinline_DoubleToFloat(-0.4999999))
        assertFloatEquals(-0.5, opt_noinline_DoubleToFloat(-0.5))
        assertFloatEquals(42.199001, opt_noinline_DoubleToFloat(42.199))
        assertFloatEquals(-42.199001, opt_noinline_DoubleToFloat(-42.199))
        assertFloatEquals(2147483648.0, opt_noinline_DoubleToFloat(2147483647.0)) // 2^31 - 1
        assertFloatEquals(-2147483648.0, opt_noinline_DoubleToFloat(-2147483647.0)) // -(2^31 - 1)
        assertFloatEquals(-2147483648.0, opt_noinline_DoubleToFloat(-2147483648.0)) // -(2^31)
        assertFloatEquals(2147483648.0, opt_noinline_DoubleToFloat(2147483648.0)) // (2^31)
        assertFloatEquals(-2147483648.0, opt_noinline_DoubleToFloat(-2147483649.0)) // -(2^31 + 1)
        assertFloatEquals(9223372036854775808.0, opt_noinline_DoubleToFloat(9223372036854775807.0)) // 2^63 - 1
        assertFloatEquals(-9223372036854775808.0, opt_noinline_DoubleToFloat(-9223372036854775807.0)) // -(2^63 - 1)
        assertFloatEquals(-9223372036854775808.0, opt_noinline_DoubleToFloat(-9223372036854775808.0)) // -(2^63)
    }

    public static func shortToByte(): Unit {
        assertByteEquals(Int8(1), opt_noinline_ShortToByte(Int16(1)))
        assertByteEquals(Int8(0), opt_noinline_ShortToByte(Int16(0)))
        assertByteEquals(Int8(-1), opt_noinline_ShortToByte(Int16(-1)))
        assertByteEquals(Int8(51), opt_noinline_ShortToByte(Int16(51)))
        assertByteEquals(Int8(-51), opt_noinline_ShortToByte(Int16(-51)))
        assertByteEquals(Int8(127), opt_noinline_ShortToByte(Int16(127))) // 2^7 - 1
        assertByteEquals(Int8(-127), opt_noinline_ShortToByte(Int16(-127))) // -(2^7 - 1)
        assertByteEquals(Int8(-128), opt_noinline_ShortToByte(Int16(-128))) // -(2^7)
        assertByteEquals(Int8(-128), opt_noinline_ShortToByte(Int16(128))) // 2^7
        assertByteEquals(Int8(127), opt_noinline_ShortToByte(Int16(-129))) // -(2^7 + 1)
        assertByteEquals(Int8(-1), opt_noinline_ShortToByte(Int16(32767))) // 2^15 - 1
        assertByteEquals(Int8(0), opt_noinline_ShortToByte(Int16(-32768))) // -(2^15)
    }

    public static func intToByte(): Unit {
        assertByteEquals(Int8(1), opt_noinline_IntToByte(1))
        assertByteEquals(Int8(0), opt_noinline_IntToByte(0))
        assertByteEquals(Int8(-1), opt_noinline_IntToByte(-1))
        assertByteEquals(Int8(51), opt_noinline_IntToByte(51))
        assertByteEquals(Int8(-51), opt_noinline_IntToByte(-51))
        assertByteEquals(Int8(127), opt_noinline_IntToByte(127)) // 2^7 - 1
        assertByteEquals(Int8(-127), opt_noinline_IntToByte(-127)) // -(2^7 - 1)
        assertByteEquals(Int8(-128), opt_noinline_IntToByte(-128)) // -(2^7)
        assertByteEquals(Int8(-128), opt_noinline_IntToByte(128)) // 2^7
        assertByteEquals(Int8(127), opt_noinline_IntToByte(-129)) // -(2^7 + 1)
        assertByteEquals(Int8(-1), opt_noinline_IntToByte(2147483647)) // 2^31 - 1
        assertByteEquals(Int8(0), opt_noinline_IntToByte(-2147483648)) // -(2^31)
    }

    public static func byteToShort(): Unit {
        assertShortEquals(Int16(1), opt_noinline_ByteToShort(Int8(1)))
        assertShortEquals(Int16(0), opt_noinline_ByteToShort(Int8(0)))
        assertShortEquals(Int16(-1), opt_noinline_ByteToShort(Int8(-1)))
        assertShortEquals(Int16(51), opt_noinline_ByteToShort(Int8(51)))
        assertShortEquals(Int16(-51), opt_noinline_ByteToShort(Int8(-51)))
        assertShortEquals(Int16(127), opt_noinline_ByteToShort(Int8(127))) // 2^7 - 1
        assertShortEquals(Int16(-127), opt_noinline_ByteToShort(Int8(-127))) // -(2^7 - 1)
        assertShortEquals(Int16(-128), opt_noinline_ByteToShort(Int8(-128))) // -(2^7)
    }

    public static func intToShort(): Unit {
        assertShortEquals(Int16(1), opt_noinline_IntToShort(1))
        assertShortEquals(Int16(0), opt_noinline_IntToShort(0))
        assertShortEquals(Int16(-1), opt_noinline_IntToShort(-1))
        assertShortEquals(Int16(51), opt_noinline_IntToShort(51))
        assertShortEquals(Int16(-51), opt_noinline_IntToShort(-51))
        assertShortEquals(Int16(32767), opt_noinline_IntToShort(32767)) // 2^15 - 1
        assertShortEquals(Int16(-32767), opt_noinline_IntToShort(-32767)) // -(2^15 - 1)
        assertShortEquals(Int16(-32768), opt_noinline_IntToShort(-32768)) // -(2^15)
        assertShortEquals(Int16(-32768), opt_noinline_IntToShort(32768)) // 2^15
        assertShortEquals(Int16(32767), opt_noinline_IntToShort(-32769)) // -(2^15 + 1)
        assertShortEquals(Int16(-1), opt_noinline_IntToShort(2147483647)) // 2^31 - 1
        assertShortEquals(Int16(0), opt_noinline_IntToShort(-2147483648)) // -(2^31)
    }

    // These methods produce int-to-long Dex instructions.
    public static func opt_noinline_ByteToLong(a: Int8): Int64 {
        return Int64(a)
    }

    public static func opt_noinline_ShortToLong(a: Int16): Int64 {
        return Int64(a)
    }

    public static func opt_noinline_IntToLong(a: Int32): Int64 {
        return Int64(a)
    }

    public static func opt_noinline_RuneToLong(a: Int32): Int64 {
        return Int64(a)
    }

    // These methods produce int-to-float Dex instructions.
    public static func opt_noinline_ByteToFloat(a: Int8): Float32 {
        return Float32(a)
    }

    public static func opt_noinline_ShortToFloat(a: Int16): Float32 {
        return Float32(a)
    }

    public static func opt_noinline_IntToFloat(a: Int32): Float32 {
        return Float32(a)
    }

    public static func opt_noinline_RuneToFloat(a: Rune): Float32 {
        return Float32(UInt32(a))
    }

    // These methods produce int-to-double Dex instructions.
    public static func opt_noinline_ByteToDouble(a: Int8): Float64 {
        return Float64(a)
    }

    public static func opt_noinline_ShortToDouble(a: Int16): Float64 {
        return Float64(a)
    }

    public static func opt_noinline_IntToDouble(a: Int32): Float64 {
        return Float64(a)
    }

    public static func opt_noinline_RuneToDouble(a: Int32): Float64 {
        return Float64(a)
    }

    // These methods produce long-to-int Dex instructions.
    @OverflowWrapping
    public static func opt_noinline_LongToInt(a: Int64): Int32 {
        return Int32(a)
    }

    public static func opt_noinline_LongLiteralToInt(): Int32 {
        return 42
    }

    // This method produces a long-to-float Dex instruction.
    public static func opt_noinline_LongToFloat(a: Int64): Float32 {
        return Float32(a)
    }

    // This method produces a long-to-double Dex instruction.
    public static func opt_noinline_LongToDouble(a: Int64): Float64 {
        return Float64(a)
    }

    // This method produces a float-to-int Dex instruction.
    public static func opt_noinline_FloatToInt(a: Float32): Int32 {
        return Int32(a)
    }

    // This method produces a float-to-long Dex instruction.
    public static func opt_noinline_FloatToLong(a: Float32): Int64 {
        return Int64(a)
    }

    // This method produces a float-to-double Dex instruction.
    public static func opt_noinline_FloatToDouble(a: Float32): Float64 {
        return Float64(a)
    }

    // This method produces a double-to-int Dex instruction.
    public static func opt_noinline_DoubleToInt(a: Float64): Int32 {
        return Int32(a)
    }

    // This method produces a double-to-long Dex instruction.
    public static func opt_noinline_DoubleToLong(a: Float64): Int64 {
        return Int64(a)
    }

    // This method produces a double-to-float Dex instruction.
    @OverflowWrapping
    public static func opt_noinline_DoubleToFloat(a: Float64): Float32 {
        return Float32(a)
    }

    // These methods produce int-to-byte Dex instructions.
    @OverflowWrapping
    public static func opt_noinline_ShortToByte(a: Int16): Int8 {
        return Int8(a)
    }

    @OverflowWrapping
    public static func opt_noinline_IntToByte(a: Int32): Int8 {
        return Int8(a)
    }

    public static func opt_noinline_RuneToByte(a: Rune): Int8 {
        return Int8(UInt32(a))
    }

    // These methods produce int-to-short Dex instructions.
    public static func opt_noinline_ByteToShort(a: Int8): Int16 {
        return Int16(a)
    }

    @OverflowWrapping
    public static func opt_noinline_IntToShort(a: Int32): Int16 {
        return Int16(a)
    }

    public static func opt_noinline_RuneToShort(a: Rune): Int16 {
        return Int16(UInt32(a))
    }

    // These methods produce int-to-char Dex instructions.
    public static func opt_noinline_ByteToRune(a: Int8): Rune {
        return Rune(UInt32(a))
    }

    public static func opt_noinline_ShortToRune(a: Int16): Rune {
        return Rune(UInt32(a))
    }

    public static func opt_noinline_IntToRune(a: Int32): Rune {
        return Rune(UInt32(a))
    }
}

main(): Int64 {
    // Generate, compile and check int-to-long Dex instructions.
    Main.byteToLong()
    Main.shortToLong()
    Main.intToLong()

    // Generate, compile and check int-to-float Dex instructions.
    Main.byteToFloat()
    Main.shortToFloat()
    Main.intToFloat()

    // Generate, compile and check int-to-double Dex instructions.
    Main.byteToDouble()
    Main.shortToDouble()
    Main.intToDouble()

    // Generate, compile and check long-to-int Dex instructions.
    Main.longToInt()

    // Generate, compile and check long-to-float Dex instructions.
    Main.longToFloat()

    // Generate, compile and check long-to-double Dex instructions.
    Main.longToDouble()

    // Generate, compile and check float-to-int Dex instructions.
    Main.floatToInt()

    // Generate, compile and check float-to-long Dex instructions.
    Main.floatToLong()

    // Generate, compile and check float-to-double Dex instructions.
    Main.floatToDouble()

    // Generate, compile and check double-to-int Dex instructions.
    Main.doubleToInt()

    // Generate, compile and check double-to-long Dex instructions.
    Main.doubleToLong()

    // Generate, compile and check double-to-float Dex instructions.
    Main.doubleToFloat()

    // Generate, compile and check int-to-byte Dex instructions.
    Main.shortToByte()
    Main.intToByte()

    // Generate, compile and check int-to-short Dex instructions.
    Main.byteToShort()
    Main.intToShort()

    print((0).toString())
    return 0
}
