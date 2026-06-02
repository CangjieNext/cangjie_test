/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt
import std.convert.*

@Test
class FormatterTest {
    @TestCase
    func inputValidInt8Format(): Unit {
        var caseItem: Int8 = -128
        @Expect(caseItem.format("-10"), "-128      ")
        @Expect(caseItem.format("+10"), "      -128")

        @Expect(caseItem.format("-10.10"), "-0000000128")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "-00000000000000000128")

        // 精度小于长度
        @Expect(caseItem.format("-10.3"), "-128      ")

        @Expect(caseItem.format("-10.10b"), "-0010000000")
        @Expect(caseItem.format("-10.10B"), "-0010000000")
        @Expect(caseItem.format("-10.10o"), "-0000000200")
        @Expect(caseItem.format("-10.10O"), "-0000000200")
        @Expect(caseItem.format("-10.10x"), "-0000000080")
        @Expect(caseItem.format("-10.10X"), "-0000000080")
    }

    @TestCase
    func inputInValidInt8Format(): Unit {
        var caseItem: Int8 = -128
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidInt16Format(): Unit {
        var caseItem: Int16 = -32767

        //Combination  characteristics
        @Expect(caseItem.format("-10"), "-32767    ")
        @Expect(caseItem.format("+10"), "    -32767")

        @Expect(caseItem.format("-10.10"), "-0000032767")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "-00000000000000032767")

        // 精度小于长度
        @Expect(caseItem.format("-10.3"), "-32767    ")

        @Expect(caseItem.format("-10.10b"), "-111111111111111")
        @Expect(caseItem.format("-10.10B"), "-111111111111111")
        @Expect(caseItem.format("-10.10o"), "-0000077777")
        @Expect(caseItem.format("-10.10O"), "-0000077777")
        @Expect(caseItem.format("-10.10x"), "-0000007fff")
        @Expect(caseItem.format("-10.10X"), "-0000007FFF")
    }

    @TestCase
    func inputInValidInt16Format(): Unit {
        var caseItem: Int16 = -32767
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidInt32Format(): Unit {
        var caseItem: Int32 = -2147483648
        @Expect(caseItem.format("-12"), "-2147483648 ")
        @Expect(caseItem.format("+12"), " -2147483648")

        @Expect(caseItem.format("-11.11"), "-02147483648")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "-00000000002147483648")

        // 精度小于长度
        @Expect(caseItem.format("-12.3"), "-2147483648 ")

        @Expect(caseItem.format("-10.10b"), "-10000000000000000000000000000000")
        @Expect(caseItem.format("-10.10B"), "-10000000000000000000000000000000")
        @Expect(caseItem.format("-10.10o"), "-20000000000")
        @Expect(caseItem.format("-10.10O"), "-20000000000")
        @Expect(caseItem.format("-10.10x"), "-0080000000")
        @Expect(caseItem.format("-10.10X"), "-0080000000")
    }

    @TestCase
    func inputInValidInt32Format(): Unit {
        var caseItem: Int32 = -2147483648
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidInt64Format(): Unit {
        var caseItem: Int64 = -9223372036854775808
        @Expect(caseItem.format("-21"), "-9223372036854775808 ")
        @Expect(caseItem.format("+21"), " -9223372036854775808")

        @Expect(caseItem.format("-20.20"), "-09223372036854775808")

        // 精度大于长度
        @Expect(caseItem.format("-10.22"), "-0009223372036854775808")

        // 精度小于长度
        @Expect(caseItem.format("-12.3"), "-9223372036854775808")

        @Expect(caseItem.format("-10.10b"), "-1000000000000000000000000000000000000000000000000000000000000000")
        @Expect(caseItem.format("-10.10B"), "-1000000000000000000000000000000000000000000000000000000000000000")
        @Expect(caseItem.format("-10.10o"), "-1000000000000000000000")
        @Expect(caseItem.format("-10.10O"), "-1000000000000000000000")
        @Expect(caseItem.format("-10.10x"), "-8000000000000000")
        @Expect(caseItem.format("-10.10X"), "-8000000000000000")
    }

    @TestCase
    func inputInValidInt64Format(): Unit {
        var caseItem: Int64 = -9223372036854775808
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidUInt8Format(): Unit {
        var caseItem: UInt8 = 128
        @Expect(caseItem.format("-10"), "128       ")
        @Expect(caseItem.format("+10"), "      +128")
        @Expect(caseItem.format("-10.10"), "0000000128")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "00000000000000000128")

        // 精度小于长度
        @Expect(caseItem.format("-10.3"), "128       ")

        @Expect(caseItem.format("-10.10b"), "0010000000")
        @Expect(caseItem.format("-10.10B"), "0010000000")
        @Expect(caseItem.format("-10.10o"), "0000000200")
        @Expect(caseItem.format("-10.10O"), "0000000200")
        @Expect(caseItem.format("-10.10x"), "0000000080")
        @Expect(caseItem.format("-10.10X"), "0000000080")
    }

    @TestCase
    func inputInValidUInt8Format(): Unit {
        var caseItem: UInt8 = 128
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidUInt16Format(): Unit {
        var caseItem: UInt16 = 32767

        //Combination  characteristics
        @Expect(caseItem.format("-10"), "32767     ")
        @Expect(caseItem.format("+10"), "    +32767")

        @Expect(caseItem.format("-10.10"), "0000032767")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "00000000000000032767")

        // 精度小于长度
        @Expect(caseItem.format("-10.3"), "32767     ")

        @Expect(caseItem.format("-10.10b"), "111111111111111")
        @Expect(caseItem.format("-10.10B"), "111111111111111")
        @Expect(caseItem.format("-10.10o"), "0000077777")
        @Expect(caseItem.format("-10.10O"), "0000077777")
        @Expect(caseItem.format("-10.10x"), "0000007fff")
        @Expect(caseItem.format("-10.10X"), "0000007FFF")
    }

    @TestCase
    func inputInValidUInt16Format(): Unit {
        var caseItem: UInt16 = 32767
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidUInt32Format(): Unit {
        var caseItem: UInt32 = 2147483648
        @Expect(caseItem.format("-12"), "2147483648  ")
        @Expect(caseItem.format("+12"), " +2147483648")

        @Expect(caseItem.format("-11.11"), "02147483648")

        // 精度大于长度
        @Expect(caseItem.format("-10.20"), "00000000002147483648")

        // 精度小于长度
        @Expect(caseItem.format("-12.3"), "2147483648  ")

        @Expect(caseItem.format("-10.10b"), "10000000000000000000000000000000")
        @Expect(caseItem.format("-10.10B"), "10000000000000000000000000000000")
        @Expect(caseItem.format("-10.10o"), "20000000000")
        @Expect(caseItem.format("-10.10O"), "20000000000")
        @Expect(caseItem.format("-10.10x"), "0080000000")
        @Expect(caseItem.format("-10.10X"), "0080000000")
    }

    @TestCase
    func inputInValidUInt32Format(): Unit {
        var caseItem: UInt32 = 2147483648
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidUInt64Format(): Unit {
        var caseItem: UInt64 = 9223372036854775808
        @Expect(caseItem.format("-21"), "9223372036854775808  ")
        @Expect(caseItem.format("+21"), " +9223372036854775808")

        @Expect(caseItem.format("-20.20"), "09223372036854775808")

        // 精度大于长度
        @Expect(caseItem.format("-10.22"), "0009223372036854775808")

        // 精度小于长度
        @Expect(caseItem.format("-12.3"), "9223372036854775808")

        @Expect(caseItem.format("-10.10b"), "1000000000000000000000000000000000000000000000000000000000000000")
        @Expect(caseItem.format("-10.10B"), "1000000000000000000000000000000000000000000000000000000000000000")
        @Expect(caseItem.format("-10.10o"), "1000000000000000000000")
        @Expect(caseItem.format("-10.10O"), "1000000000000000000000")
        @Expect(caseItem.format("-10.10x"), "8000000000000000")
        @Expect(caseItem.format("-10.10X"), "8000000000000000")
    }

    @TestCase
    func inputInValidUInt64Format(): Unit {
        var caseItem: UInt64 = 9223372036854775808
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.d")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10A")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,3)
    }

    @TestCase
    func inputValidRuneFormat(): Unit {
        var caseItem: Rune = r'a'
        @Expect(caseItem.format("-10"), "a         ")
        @Expect(caseItem.format("10"), "         a")
        @Expect(caseItem.format(""), "a")
    }

    @TestCase
    func inputInValidRuneFormat(): Unit {
        var caseItem: Rune = r'a'
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("+")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("#")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("0")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("0b")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,5)
    }

    @TestCase
    func inputValidFloat16Format(): Unit {
        var caseItem01: Float16 = -0.34
        var caseItem02: Float16 = 123412341234.1
        @Expect(caseItem01.format("-10"), "-0.340088 ")
        @Expect(caseItem01.format("+10"), " -0.340088")
        @Expect(caseItem01.format("010"), "-00.340088")
        @Expect(caseItem01.format("010.1"), "-0000000.3")
        @Expect(caseItem01.format("010.10"), "-0.3400878906")
        @Expect(caseItem01.format("010.10e"), "-3.4008789062e-01")
        @Expect(caseItem01.format("010.10E"), "-3.4008789062E-01")
        @Expect(caseItem01.format("010.10g"), "-0.3400878906")
        @Expect(caseItem01.format("010.10G"), "-0.3400878906")
        @Expect(caseItem02.format("010.10g"), "0000000inf")
    }
    @TestCase
    func inputInValidFloat16Format(): Unit {
        var caseItem: Float16 = -0.34
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.b")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    @TestCase
    func inputValidFloat32Format(): Unit {
        var caseItem01: Float32 = -0.34
        var caseItem02: Float32 = 123412341234.1
        @Expect(caseItem01.format("-10"), "-0.340000 ")
        @Expect(caseItem01.format("+10"), " -0.340000")
        @Expect(caseItem01.format("010"), "-00.340000")
        @Expect(caseItem01.format("010.1"), "-0000000.3")
        @Expect(caseItem01.format("010.10"), "-0.3400000036")
        @Expect(caseItem01.format("010.10e"), "-3.4000000358e-01")
        @Expect(caseItem01.format("010.10E"), "-3.4000000358E-01")
        @Expect(caseItem01.format("010.10g"), "-0.3400000036")
        @Expect(caseItem01.format("010.10G"), "-0.3400000036")
        @Expect(caseItem02.format("010.10g"), "1.234123407e+11")
    }

    @TestCase
    func inputInValidFloat32Format(): Unit {
        var caseItem: Float32 = -0.34
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.b")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    @TestCase
    func inputValidFloat64Format(): Unit {
        var caseItem01: Float64 = 3_0.3__4_
        var caseItem02: Float64 = 0.0
        var caseItem03: Float64 = -0.0

        @Expect(caseItem01.format("-10"), "30.340000 ")
        @Expect(caseItem01.format("+10"), "+30.340000")
        @Expect(caseItem01.format("010"), "030.340000")
        @Expect(caseItem01.format("010.1"), "00000030.3")
        @Expect(caseItem01.format("010.10"), "30.3400000000")
        @Expect(caseItem01.format("010.10e"), "3.0340000000e+01")
        @Expect(caseItem01.format("010.10E"), "3.0340000000E+01")
        @Expect(caseItem01.format("010.10g"), "0000030.34")
        @Expect(caseItem01.format("010.10G"), "0000030.34")

        @Expect(caseItem02.format("-10"), "0.000000  ")
        @Expect(caseItem02.format("+10"), " +0.000000")
        @Expect(caseItem02.format("010"), "000.000000")
        @Expect(caseItem02.format("010.1"), "00000000.0")
        @Expect(caseItem02.format("010.10"), "0.0000000000")
        @Expect(caseItem02.format("010.10e"), "0.0000000000e+00")
        @Expect(caseItem02.format("010.10E"), "0.0000000000E+00")
        @Expect(caseItem02.format("010.10g"), "0000000000")
        @Expect(caseItem02.format("010.10G"), "0000000000")

        @Expect(caseItem03.format("-10"), "-0.000000 ")
        @Expect(caseItem03.format("+10"), " -0.000000")
        @Expect(caseItem03.format("010"), "-00.000000")
        @Expect(caseItem03.format("010.1"), "-0000000.0")
        @Expect(caseItem03.format("010.10"), "-0.0000000000")
        @Expect(caseItem03.format("010.10e"), "-0.0000000000e+00")
        @Expect(caseItem03.format("010.10E"), "-0.0000000000E+00")
        @Expect(caseItem03.format("010.10g"), "-000000000")
        @Expect(caseItem03.format("010.10G"), "-000000000")
    }
    @TestCase
    func inputInValidFloat64Format(): Unit {
        var caseItem: Float64 = -0.34
        var countError = 0
        try {
            caseItem.format("*")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            caseItem.format("10.b")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        @Expect(countError,2)
    }

    @TestCase
    func inputInValidString(): Unit {
        let arr: Array<Byte> = [192, 184]
        let str = unsafe { String.fromUtf8Unchecked(arr) }
        try {
            r'0'.format(str)
        } catch (e: IllegalArgumentException) {
            return
        }
        @Expect(false)
    }

    @TestCase
    func formatWidthOverflow(): Unit {
        let largeWidthInputs: Array<String> = ["999999999", "1000000000", "999999999999"]
        for (fmt in largeWidthInputs) {
            var caught = false
            try {
                var result = Int64(1).format(fmt)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                // Print actual error message for debugging
                println("Actual error message for format '${fmt}': ${e.message}")
                caught = true
            } catch (e: OutOfMemoryError) {
                caught = true
            }
            @Assert(caught)
        }
    }

    @TestCase
    func formatFloatPrecisionOverflow(): Unit {
        let largePrecisionFloatInputs: Array<String> = [".999999999999999999e", ".100000000000000000E", ".999999999999999999g"]
        for (fmt in largePrecisionFloatInputs) {
            var caught = false
            try {
                var result = Float64(1.0).format(fmt)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                println("Actual error message for format '${fmt}': ${e.message}")
                caught = true
            } catch (e: OutOfMemoryError) {
                caught = true
            }
            @Assert(caught)
        }
    }

    @TestCase
    func formatFloatPrecisionExceedsMaxFloatPrecision(): Unit {
        let mediumPrecisionFloatInputs: Array<String> = [".351e", ".500E", ".1000g"]
        for (fmt in mediumPrecisionFloatInputs) {
            var caught = false
            try {
                var result = Float64(1.0).format(fmt)
                @Expect(false)
            } catch (e: IllegalArgumentException) {
                println("Actual error message for format '${fmt}': ${e.message}")
                @Assert(e.message.contains("precision"))
                @Assert(e.message.contains("exceeds maximum"))
                caught = true
            }
            @Assert(caught)
        }
    }

    @TestCase
    func formatWidthOnlyNoSpecifier(): Unit {
        @Expect(Int64(42).format("10"), "        42")
        @Expect(Int64(42).format("5"), "   42")
        @Expect(Int64(42).format("012"), "000000000042")
        @Expect(Int64(-42).format("5"), "  -42")
    }

    @TestCase
    func formatPrecisionOnlyNoSpecifier(): Unit {
        @Expect(Int64(42).format(".5"), "00042")
        @Expect(Int64(42).format(".10"), "0000000042")
    }

    @TestCase
    func formatWidthAndPrecisionNoSpecifier(): Unit {
        @Expect(Int64(42).format("10.5"), "     00042")
        @Expect(Int64(42).format("8.8"), "00000042")
    }
}
