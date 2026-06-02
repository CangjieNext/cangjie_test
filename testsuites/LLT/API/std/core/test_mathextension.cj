/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.*
import std.convert.*
/*
 * Test description: Test the funcs for math
 * Test class:
 * public interface MathExtension
 */
@Test
class MathExtensionTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message.contains(expectMessage)) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: Test Float64 ::MathExtension
     * Test API:
     * extend Float64 <: MathExtension
     */
    @TestCase
    func testMathExtensionFloat64(): Unit {
        @Expect("${Float64.NaN}","nan")
        @Expect("${Float64.Inf}","inf")
        @Expect("${Float64.GetPI().format(".15")}","3.141592653589793")
        @Expect("${Float64.GetE().format(".15")}","2.718281828459045")
        @Expect(Float64.Max is Float64)
        @Expect(Float64.Min is Float64)
        @Expect(Float64.MinDenormal, Float64(Float64(1.0 / Float64(2.0 ** 0x3FE)) * Float64(1.0 / Float64(1 << 52))))
        @Expect(Float64.MinNormal, Float64(Float64(1.0 / Float64(2.0 ** 0x3FE)) * Float64(1.0)))
        @Expect(Float64.Inf.isInf())
        @Expect(!Float64(3.14).isInf())
        @Expect(Float64.NaN.isNaN())
        @Expect(!Float64(0).isNaN())
        @Expect(Float64(0.1).isNormal())
        @Expect(!Float64(0).isNormal())
        @Expect(Float64.max(3.14, Float64.NaN, -3.14).isNaN())
        @Expect(Float64.min(3.14, Float64.NaN, -3.14).isNaN())
    }

    /*
     * Test description: Test Float32 ::MathExtension
     * Test API:
     * extend Float32 <: MathExtension
     */
    @TestCase
    func testMathExtensionFloat32(): Unit {
        @Expect("${Float32.NaN}","nan")
        @Expect("${Float32.Inf}","inf")
        @Expect("${Float32.GetPI().format(".7")}","3.1415927")
        @Expect("${Float32.GetE().format(".7")}","2.7182817")
        @Expect(Float32.Max is Float32)
        @Expect(Float32.Min is Float32)
        @Expect(Float32.MinDenormal, Float32(Float64(1.0 / Float64(2.0 ** 0x7E)) * Float64(1.0 / Float64(1 << 23))))
        @Expect(Float32.MinNormal, Float32(Float64(1.0 / Float64(2.0 ** 0x7E)) * Float64(1.0)))
        @Expect(Float32.Inf.isInf())
        @Expect(!Float32(3.14).isInf())
        @Expect(Float32.NaN.isNaN())
        @Expect(!Float32(0).isNaN())
        @Expect(Float32(0.1).isNormal())
        @Expect(!Float32(0).isNormal())
        @Expect(Float32.max(3.14, Float32.NaN, -3.14).isNaN())
        @Expect(Float32.min(3.14, Float32.NaN, -3.14).isNaN())
    }
    /*
     * Test description: Test Float16 ::MathExtension
     * Test API:
     * extend Float16 <: MathExtension
     */
    @TestCase
    func testMathExtensionFloat16(): Unit {
        @Expect("${Float16.NaN}","nan")
        @Expect("${Float16.Inf}","inf")
        @Expect("${Float16.GetPI().format(".6")}","3.140625")
        @Expect("${Float16.GetE().format(".6")}","2.718750")
        @Expect(Float16.Max,Float16((1.0 + Float64((Float64(1 << 10) - 1.0) / Float64(1 << 10))) * Float64(2.0 ** 0xF)))
        @Expect(Float16.Min,(Float16((1.0 + Float64((Float64(1 << 10) - 1.0) / Float64(1 << 10))) * Float64(2.0 ** 0xF))) * Float16(-1.0))
        @Expect(Float16.MinDenormal, Float16(Float64(1.0 / Float64(2.0 ** 0xE)) * Float64(1.0 / Float64(1 << 10))))
        @Expect(Float16.MinNormal, Float16(Float64(1.0 / Float64(2.0 ** 0xE)) * Float64(1.0)))
        @Expect(Float16.Inf.isInf())
        @Expect(!Float16(3.14).isInf())
        @Expect(Float16.NaN.isNaN())
        @Expect(!Float16(0).isNaN())
        @Expect(Float16(0.1).isNormal())
        @Expect(!Float16(0).isNormal())
        @Expect(Float16.max(3.14, Float16.NaN, -3.14).isNaN())
        @Expect(Float16.min(3.14, Float16.NaN, -3.14).isNaN())
    }

    /*
     * Test description: Test Int64 ::MathExtension
     * Test API:
     * extend Int64  <: MathExtension
     * extend Int32  <: MathExtension
     * extend Int16  <: MathExtension
     * extend Int8  <: MathExtension
     * extend UInt64  <: MathExtension
     * extend UInt32  <: MathExtension
     * extend UInt16  <: MathExtension
     * extend UInt8  <: MathExtension
     * extend IntNative  <: MathExtension
     * extend UIntNative  <: MathExtension
     */
    @TestCase
    func testMathExtensionMaxTrr(): Unit {
        @Expect(Int64.Max,9223372036854775807)
        @Expect(Int64.Min, -9223372036854775808)
        @Expect(Int32.Max,2147483647)
        @Expect(Int32.Min, -2147483648)
        @Expect(Int16.Max,32767)
        @Expect(Int16.Min, -32768)
        @Expect(Int8.Max,127)
        @Expect(Int8.Min, -128)
        @Expect(UInt64.Max,18446744073709551615)
        @Expect(UInt64.Min, 0)
        @Expect(UInt32.Max,4294967295)
        @Expect(UInt32.Min, 0)
        @Expect(UInt16.Max,65535)
        @Expect(UInt16.Min, 0)
        @Expect(UInt8.Max,255)
        @Expect(UInt8.Min, 0)
        @Expect(IntNative.Max,9223372036854775807)
        @Expect(IntNative.Min, -9223372036854775808)
        @Expect(UIntNative.Max,18446744073709551615)
        @Expect(UIntNative.Min, 0)
    }

    /*
     * Test description: Test checkedAbs::MathExtension
     * Test API:
     * public func checkedAbs(x: Int64): Option<Int64>
     * public func checkedAbs(x: Int32): Option<Int32>
     * public func checkedAbs(x: Int16): Option<Int16>
     * public func checkedAbs(x: Int8): Option<Int8>
     */
    @TestCase
    func testMathExtensionCheckedAbs(): Unit {
        @Expect(checkedAbs(Int8(3)).getOrThrow(), 3)
        @Expect(checkedAbs(Int8(-128)).isNone())

        @Expect(checkedAbs(Int16(3)).getOrThrow(), 3)
        @Expect(checkedAbs(Int16(-32768)).isNone())

        @Expect(checkedAbs(Int32(3)).getOrThrow(), 3)
        @Expect(checkedAbs(Int32(-2147483648)).isNone())

        @Expect(checkedAbs(Int64(3)).getOrThrow(), 3)
        @Expect(checkedAbs(Int64(-9223372036854775808)).isNone())
    }

    /*
     * Test description: Test cbrt::MathExtension
     * Test API:
     * public func cbrt(x: Float64): Float64
     * public func cbrt(x: Float32): Float32
     * public func cbrt(x: Float16): Float16
     */
    @TestCase
    func testMathExtensionCbrt(): Unit {
        @Expect("${cbrt(Float64(2.0))}","1.259921")
        @Expect("${cbrt(Float32(2.0))}","1.259921")
        @Expect("${cbrt(Float16(2.0))}","1.259766")
    }

    /*
     * Test description: Test clamp::MathExtension
     * Test API:
     * public func clamp(v: Float64, min: Float64, max: Float64): Float64
     * public func clamp(v: Float32, min: Float32, max: Float32): Float32
     * public func clamp(v: Float16, min: Float16, max: Float16): Float16
     */
    @TestCase
    func testMathExtensionClamp(): Unit {
        // Float16
        var min1Float16: Float16 = -0.123
        var max1Float16: Float16 = 0.123
        var v1Float16: Float16 = 0.121
        @Expect(clamp(v1Float16,min1Float16,max1Float16),v1Float16)

        var min2Float16: Float16 = -0.999
        var max2Float16: Float16 = 10.123
        var v2Float16: Float16 = 11.121
        @Expect(clamp(v2Float16,min2Float16,max2Float16),max2Float16)

        var min3Float16: Float16 = -0.999
        var max3Float16: Float16 = 10.123
        var v3Float16: Float16 = -1.121
        @Expect(clamp(v3Float16,min3Float16,max3Float16),min3Float16)

        // Float32
        var minFloat32: Float32 = -0.123
        var maxFloat32: Float32 = 0.123
        var vFloat32: Float32 = 0.121
        @Expect(clamp(vFloat32,minFloat32,maxFloat32),vFloat32)

        var min2Float32: Float32 = -0.999
        var max2Float32: Float32 = 10.123
        var v2Float32: Float32 = 11.121
        @Expect(clamp(v2Float32,min2Float32,max2Float32),max2Float32)
        var min3Float32: Float32 = -0.999
        var max3Float32: Float32 = 10.123
        var v3Float32: Float32 = -1.121
        @Expect(clamp(v3Float32,min3Float32,max3Float32),min3Float32)
    }
    /*
     * Test description: Test clamp::MathExtension
     * Test API:
     * public func clamp(v: Float64, min: Float64, max: Float64): Float64
     * public func clamp(v: Float32, min: Float32, max: Float32): Float32
     * public func clamp(v: Float16, min: Float16, max: Float16): Float16
     */
    @TestCase
    func testInvalidMathExtensionClamp(): Unit {
        var caseException01: ?Exception = None
        try {
            var min: Float16 = 10.999
            var max: Float16 = -10.123
            var v: Float16 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_01",
            caseException01,
            "Check parameter min:'11.000000' or max:'-10.125000'."
        )
        var caseException02: ?Exception = None
        try {
            var min: Float16 = Float16.NaN
            var max: Float16 = Float16.NaN
            var v: Float16 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_02",
            caseException02,
            "Check parameter min:'nan' or max:'nan'."
        )

        var caseException03: ?Exception = None
        try {
            var min: Float32 = 10.999
            var max: Float32 = -10.123
            var v: Float32 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_03",
            caseException03,
            "Check parameter min:'10.999000' or max:'-10.123000'."
        )
        var caseException04: ?Exception = None
        try {
            var min: Float32 = Float32.NaN
            var max: Float32 = Float32.NaN
            var v: Float32 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_04",
            caseException04,
            "Check parameter min:'nan' or max:'nan'."
        )

        var caseException05: ?Exception = None
        try {
            var min: Float64 = 10.999
            var max: Float64 = -10.123
            var v: Float64 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_05",
            caseException05,
            "Check parameter min:'10.999000' or max:'-10.123000'."
        )
        var caseException06: ?Exception = None
        try {
            var min: Float64 = Float64.NaN
            var max: Float64 = Float64.NaN
            var v: Float64 = -1.121
            clamp(v, min, max)
        } catch (e: IllegalArgumentException) {
            caseException06 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionClamp_06",
            caseException06,
            "Check parameter min:'nan' or max:'nan'."
        )
    }

    /*
     * Test description: Test countOne::MathExtension
     * Test API:
     * public func countOnes(x: Int32): Int64
     * public func countOnes(x: Int16): Int64
     * public func countOnes(x: Int8): Int64
     * public func countOnes(x: UInt64): Int64
     * public func countOnes(x: UInt32): Int64
     * public func countOnes(x: UInt16): Int64
     * public func countOnes(x: UInt8): Int64
     */
    @TestCase
    func testMathExtensionCountOne(): Unit {
        @Expect(countOnes(Int8(-99)),5)
        @Expect(countOnes(Int16(-99)),5)
        @Expect(countOnes(Int32(-99)),5)

        @Expect(countOnes(UInt8(99)),4)
        @Expect(countOnes(UInt16(99)),4)
        @Expect(countOnes(UInt32(99)),4)
    }
    /*
     * Test description: Test erf::MathExtension
     * Test API:
     * public func erf(x: Float64): Float64
     * public func erf(x: Float32): Float32
     * public func erf(x: Float16): Float16
     */
    @TestCase
    func testMathExtensionErf(): Unit {
        @Expect("${erf(Float64(3.4))}","0.999998")
        @Expect("${erf(Float32(3.4))}","0.999998")
        @Expect("${erf(Float16(3.4))}","1.000000")
    }

    /*
     * Test description: Test gamma::MathExtension
     * Test API:
     * public func gamma(x: Float64): Float64
     * public func gamma(x: Float32): Float32
     * public func gamma(x: Float16): Float16
     */
    @TestCase
    func testMathExtensionGamma(): Unit {
        @Expect("${gamma(Float64(3.4))}","2.981206")
        @Expect("${gamma(Float32(3.4))}","2.981207")
        @Expect("${gamma(Float16(3.4))}","2.982422")
    }

    /*
     * Test description: Test gcd::MathExtension
     * Test API:
     * public func gcd(x: Int64, y: Int64): Int64
     * public func gcd(x: Int32, y: Int32): Int32
     * public func gcd(x: Int16, y: Int16): Int16
     * public func gcd(x: Int8, y: Int8): Int8
     * public func gcd(x: UInt64, y: UInt64): UInt64
     * public func gcd(x: UInt32, y: UInt32): UInt32
     * public func gcd(x: UInt32, y: UInt32): UInt32
     * public func gcd(x: UInt8, y: UInt8): UInt8
     */
    @TestCase
    func testMathExtensionGcd(): Unit {
        @Expect( gcd(Int8(-128),Int8(127)),Int8(1))
        @Expect(gcd(Int8(-60),Int8(0)),Int8(60))
        @Expect(gcd(Int8(-1),Int8(1)),Int8(1))
        @Expect(gcd(Int8(-33),Int8(27)),Int8(3))

        @Expect( gcd(Int16(-32768),Int16(32767)),Int16(1))
        @Expect(gcd(Int16(-60),Int16(0)),Int16(60))
        @Expect(gcd(Int16(-1),Int16(1)),Int16(1))
        @Expect(gcd(Int16(-33),Int16(27)),Int16(3))

        @Expect(gcd(Int32(-2147483648),Int32(2147483647)),Int32(1))
        @Expect(gcd(Int32(-60),Int32(0)),Int32(60))
        @Expect(gcd(Int32(-1),Int32(1)),Int32(1))
        @Expect(gcd(Int32(-33),Int32(27)),Int32(3))

        @Expect(gcd(Int64(-9223372036854775808),Int64(9223372036854775807)),Int64(1))
        @Expect(gcd(Int64(-60),Int64(0)),Int64(60))
        @Expect(gcd(Int64(-1),Int64(1)),Int64(1))
        @Expect(gcd(Int64(-33),Int64(27)),Int64(3))

        @Expect(gcd(UInt8(0),UInt8(150)),UInt8(150))
        @Expect(gcd(UInt8(33),UInt8(27)),UInt8(3))

        @Expect(gcd(UInt16(0),UInt16(60)),UInt16(60))
        @Expect(gcd(UInt16(33),UInt16(27)),UInt16(3))

        @Expect(gcd(UInt32(0),UInt32(60)),UInt32(60))
        @Expect(gcd(UInt32(33),UInt32(27)),UInt32(3))

        @Expect(gcd(UInt64(0),UInt64(30)),UInt64(30))
        @Expect(gcd(UInt64(33),UInt64(27)),UInt64(3))
    }

    /*
     * Test description: Test gcd::MathExtension
     * Test API:
     * public func gcd(x: Int64, y: Int64): Int64
     * public func gcd(x: Int32, y: Int32): Int32
     * public func gcd(x: Int16, y: Int16): Int16
     * public func gcd(x: Int8, y: Int8): Int8
     */
    @TestCase
    func testInvalidMathExtensionGcd(): Unit {
        var caseException01: ?Exception = None
        try {
            gcd(Int8.Min, Int8.Min)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_01",
            caseException01,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException02: ?Exception = None
        try {
            gcd(Int8.Min, Int8(0))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_02",
            caseException02,
            "One of the parameters is minimum boundary value, and another is 0."
        )

        var caseException03: ?Exception = None
        try {
            gcd(Int16.Min, Int16.Min)
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_03",
            caseException03,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException04: ?Exception = None
        try {
            gcd(Int16.Min, Int16(0))
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_04",
            caseException04,
            "One of the parameters is minimum boundary value, and another is 0."
        )
        var caseException05: ?Exception = None
        try {
            gcd(Int32.Min, Int32.Min)
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_05",
            caseException05,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException06: ?Exception = None
        try {
            gcd(Int32.Min, Int32(0))
        } catch (e: IllegalArgumentException) {
            caseException06 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_06",
            caseException06,
            "One of the parameters is minimum boundary value, and another is 0."
        )

        var caseException07: ?Exception = None
        try {
            gcd(Int64.Min, Int64.Min)
        } catch (e: IllegalArgumentException) {
            caseException07 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_07",
            caseException07,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException08: ?Exception = None
        try {
            gcd(Int64.Min, Int64(0))
        } catch (e: IllegalArgumentException) {
            caseException08 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionGcd_08",
            caseException08,
            "One of the parameters is minimum boundary value, and another is 0."
        )
    }

    /*
     * Test description: Test lcm::MathExtension
     * Test API:
     * public func lcm(x: Int64, y: Int64): Int64
     * public func lcm(x: Int32, y: Int32): Int32
     * public func lcm(x: Int16, y: Int16): Int16
     * public func lcm(x: Int8, y: Int8): Int8
     * public func lcm(x: UInt64, y: UInt64): UInt64
     * public func lcm(x: UInt32, y: UInt32): UInt32
     * public func lcm(x: UInt16, y: UInt16): UInt16
     * public func lcm(x: UInt8, y: UInt8): UInt8
     */
    @TestCase
    func testMathExtensionLcm(): Unit {
        @Expect(lcm(Int8(3),Int8(5)),15)
        @Expect(lcm(Int8(-3),Int8(5)),15)
        @Expect(lcm(Int8(0),Int8(5)),0)
        @Expect(lcm(Int8(0),Int8(-5)),0)
        @Expect(lcm(Int8(3),Int8(0)),0)

        @Expect(lcm(Int16(3),Int16(5)),15)
        @Expect(lcm(Int16(-3),Int16(5)),15)
        @Expect(lcm(Int16(0),Int16(5)),0)
        @Expect(lcm(Int16(0),Int16(-5)),0)
        @Expect(lcm(Int16(3),Int16(0)),0)

        @Expect(lcm(Int32(3),Int32(5)),15)
        @Expect(lcm(Int32(-3),Int32(5)),15)
        @Expect(lcm(Int32(0),Int32(5)),0)
        @Expect(lcm(Int32(0),Int32(-5)),0)
        @Expect(lcm(Int32(3),Int32(0)),0)

        @Expect(lcm(Int64(3),Int64(5)),15)
        @Expect(lcm(Int64(-3),Int64(5)),15)
        @Expect(lcm(Int64(0),Int64(5)),0)
        @Expect(lcm(Int64(0),Int64(-5)),0)
        @Expect(lcm(Int64(3),Int64(0)),0)

        @Expect(lcm(UInt8(3),UInt8(5)),15)
        @Expect(lcm(UInt8(0),UInt8(5)),0)

        @Expect(lcm(UInt16(3),UInt16(5)),15)
        @Expect(lcm(UInt16(0),UInt16(5)),0)

        @Expect(lcm(UInt32(3),UInt32(5)),15)
        @Expect(lcm(UInt32(0),UInt32(5)),0)

        @Expect(lcm(UInt64(3),UInt64(5)),15)
        @Expect(lcm(UInt64(0),UInt64(5)),0)
    }
    /*
     * Test description: Test lcm::MathExtension
     * Test API:
     * public func lcm(x: Int64, y: Int64): Int64
     * public func lcm(x: Int32, y: Int32): Int32
     * public func lcm(x: Int16, y: Int16): Int16
     * public func lcm(x: Int8, y: Int8): Int8
     * public func lcm(x: UInt64, y: UInt64): UInt64
     * public func lcm(x: UInt32, y: UInt32): UInt32
     * public func lcm(x: UInt16, y: UInt16): UInt16
     * public func lcm(x: UInt8, y: UInt8): UInt8
     */
    @TestCase
    func testInvalidMathExtensionLcm(): Unit {
        var caseException01: ?Exception = None
        try {
            lcm(Int8.Min, Int8.Min)
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_01",
            caseException01,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException02: ?Exception = None
        try {
            lcm(Int8.Max, Int8.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_02",
            caseException02,
            "The result is out of the Int8 range."
        )

        var caseException03: ?Exception = None
        try {
            lcm(Int16.Min, Int16.Min)
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_03",
            caseException03,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException04: ?Exception = None
        try {
            lcm(Int16.Max, Int16.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_04",
            caseException04,
            "The result is out of the Int16 range."
        )

        var caseException05: ?Exception = None
        try {
            lcm(Int32.Min, Int32.Min)
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_05",
            caseException05,
            "Both parameters x and y are minimum boundary values."
        )
        var caseException06: ?Exception = None
        try {
            lcm(Int32.Max, Int32.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException06 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_06",
            caseException06,
            "The result is out of the Int32 range."
        )

        var caseException07: ?Exception = None
        try {
            lcm(Int64.Min, Int64.Min)
        } catch (e: IllegalArgumentException) {
            caseException07 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_07",
            caseException07,
            "Both parameters x and y are minimum boundary values."
        )

        var caseException08: ?Exception = None
        try {
            lcm(Int64.Max, Int64.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException08 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_08",
            caseException08,
            "The result is out of the Int64 range."
        )

        var caseException09: ?Exception = None
        try {
            lcm(UInt64.Max, UInt64.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException09 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_09",
            caseException09,
            "The result is out of the UInt64 range."
        )
        var caseException10: ?Exception = None
        try {
            lcm(UInt32.Max, UInt32.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException10 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_10",
            caseException10,
            "The result is out of the UInt32 range."
        )

        var caseException11: ?Exception = None
        try {
            lcm(UInt16.Max, UInt16.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException11 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_11",
            caseException11,
            "The result is out of the UInt16 range."
        )

        var caseException12: ?Exception = None
        try {
            lcm(UInt8.Max, UInt8.Max - 1)
        } catch (e: IllegalArgumentException) {
            caseException12 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_12",
            caseException12,
            "The result is out of the UInt8 range."
        )

        var caseException13: ?Exception = None
        try {
            lcm(Int8.Min, Int8.Min + 1)
        } catch (e: IllegalArgumentException) {
            caseException13 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_13",
            caseException13,
            "The result is out of the Int8 range."
        )

        var caseException14: ?Exception = None
        try {
            lcm(Int16.Min, Int16.Min + 1)
        } catch (e: IllegalArgumentException) {
            caseException14 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_14",
            caseException14,
            "The result is out of the Int16 range."
        )

        var caseException15: ?Exception = None
        try {
            lcm(Int32.Min, Int32.Min + 1)
        } catch (e: IllegalArgumentException) {
            caseException15 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_15",
            caseException15,
            "The result is out of the Int32 range."
        )

        var caseException16: ?Exception = None
        try {
            lcm(Int64.Min, Int64.Min + 1)
        } catch (e: IllegalArgumentException) {
            caseException16 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_16",
            caseException16,
            "The result is out of the Int64 range."
        )
    }

    /*
     * Test description: Test leadingZeros::MathExtension
     * Test API:
     * public func leadingZeros(x: Int64): Int64
     * public func leadingZeros(x: Int32): Int64
     * public func leadingZeros(x: Int16): Int64
     * public func leadingZeros(x: Int8): Int64
     * public func leadingZeros(x: UInt64): Int64
     * public func leadingZeros(x: UInt32): Int64
     * public func leadingZeros(x: UInt16): Int64
     * public func leadingZeros(x: UInt8): Int64
     */
    @TestCase
    func testMathExtensionLeadingZeros(): Unit {
        @Expect(leadingZeros(Int8(-99)),0)
        @Expect(leadingZeros(Int8(-0x80)) ,0x0)
        @Expect(leadingZeros(Int16(-99)),0)
        @Expect(leadingZeros(Int16(-0x8000)) , 0x0)
        @Expect(leadingZeros(Int32(-99)),0)
        @Expect(leadingZeros(Int32(-0x8000_0000)) , 0x0)
        @Expect(leadingZeros(Int64(-99)),0)
        @Expect(leadingZeros(Int64(-0x8000_0000_0000_0000)) , 0x0)
        @Expect(leadingZeros(UInt64(99)),57)
        @Expect(leadingZeros(UInt32(99)),25)
        @Expect(leadingZeros(UInt16(99)),9)
        @Expect(leadingZeros(UInt8(99)),1)
    }

    /*
     * Test description: Test logBase::MathExtension
     * Test API:
     * public func logBase(x: Float64, base: Float64): Float64
     * public func logBase(x: Float64, base: Float64): Float64
     * public func logBase(x: Float16, base: Float16): Float16
     */
    @TestCase
    func testMathExtensionLogBase(): Unit {
        @Expect(logBase(Float16(4.0),Float16(2.0)),2.0)
        @Expect(logBase(Float32(4.0),Float32(2.0)),2.0)
        @Expect(logBase(Float64(4.0),Float64(2.0)),2.0)
    }

    /*
     * Test description: Test logBase::MathExtension
     * Test API:
     * public func logBase(x: Float64, base: Float64): Float64
     * public func logBase(x: Float64, base: Float64): Float64
     * public func logBase(x: Float16, base: Float16): Float16
     */
    @TestCase
    func testInvalidMathExtensionLogBase(): Unit {
        var caseException01: ?Exception = None
        try {
            logBase(Float16(-4.0), Float16(2.0))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_01",
            caseException01,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException02: ?Exception = None
        try {
            logBase(Float16(4.0), Float16(1.0))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_02",
            caseException02,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException03: ?Exception = None
        try {
            logBase(Float32(-4.0), Float32(2.0))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_03",
            caseException03,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException04: ?Exception = None
        try {
            logBase(Float32(4.0), Float32(1.0))
        } catch (e: IllegalArgumentException) {
            caseException04 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_04",
            caseException04,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException05: ?Exception = None
        try {
            logBase(Float64(-4.0), Float64(2.0))
        } catch (e: IllegalArgumentException) {
            caseException05 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_05",
            caseException05,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException06: ?Exception = None
        try {
            logBase(Float64(4.0), Float64(1.0))
        } catch (e: IllegalArgumentException) {
            caseException06 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionLcm_06",
            caseException06,
            "The input parameter is invalid. Please enter a correct parameter."
        )
    }

    /*
     * Test description: Test max::MathExtension
     * Test API:
     * public func max(a: Int64, b: Int64): Int64
     * public func max(a: Int32, b: Int32): Int32
     * public func max(a: Int16, b: Int16): Int16
     * public func max(a: Int8, b: Int8): Int8
     * public func max(a: UInt64, b: UInt64): UInt64
     * public func max(a: UInt32, b: UInt32): UInt32
     * public func max(a: UInt16, b: UInt16): UInt16
     * public func max(a: UInt8, b: UInt8): UInt8
     * public func max(a: Float64, b: Float64): Float64
     * public func max(a: Float32, b: Float32): Float32
     * public func max(a: Float16, b: Float16): Float16
     */
    @TestCase
    func testMathExtensionMax(): Unit {
        @Expect(max(Int8(-3),Int8(-5)),-3)
        @Expect(max(Int16(-3),Int16(-5)),-3)
        @Expect(max(Int32(-3),Int32(-5)),-3)
        @Expect(max(Int64(-3),Int64(-5)),-3)
        @Expect(max(UInt8(3),UInt8(5)),5)
        @Expect(max(UInt16(3),UInt16(5)),5)
        @Expect(max(UInt32(3),UInt32(5)),5)
        @Expect(max(UInt64.Max,UInt64(5)),UInt64.Max)
        @Expect(max(Float16(-4.0),Float16(-3.0)),-3.0)
        @Expect(max(Float32(-4.0),Float32(-3.0)),-3.0)
        @Expect(max(Float64(-4.0),Float64(-3.0)),-3.0)

        @Expect(max(Int8(-3),Int8(-5),Int8(-5),Int8(-6)),-3)
        @Expect(max(Int8(-3),Int8(-3),Int8(-5),Int8(-6)),-3)
        @Expect(max(Float16(-4.0),Float16(-3.0),Float16(-4.0),Float16(-3.0)),-3.0)

        @Expect(Float16.max(Float16(5), Float16.NaN).isNaN())
        @Expect(Float16.max(Float16.NaN, Float16(5)).isNaN())
        @Expect(Float32.max(Float32(5), Float32.NaN).isNaN())
        @Expect(Float32.max(Float32.NaN, Float32(5)).isNaN())
        @Expect(Float64.max(Float64(5), Float64.NaN).isNaN())
        @Expect(Float64.max(Float64.NaN, Float64(5)).isNaN())
        @Expect(Float16.max(Float16(-4.0),Float16(-3.0),Float16(-4.0),Float16(-3.0)),Float16(-3.0))
        @Expect(Float32.max(Float32(-4.0),Float32(-3.0),Float32(-4.0),Float32(-3.0)),Float32(-3.0))
        @Expect(Float64.max(Float64(-4.0),Float64(-3.0),Float64(-4.0),Float64(-3.0)),Float64(-3.0))
    }

    /*
     * Test description: Test MaxNaN::MathExtension
     * Test API:
     * public func maxNaN(a: Float64, b: Float64): Float64
     * public func maxNaN(a: Float32, b: Float32): Float32
     * public func maxNaN(a: Float16, b: Float16): Float16
     */
    @TestCase
    func testMathExtensionMaxNaN(): Unit {
        @Expect("${Float16.max(Float16(1.23),Float16.NaN)}","${Float16.NaN}")
        @Expect("${Float16.max(Float16.NaN,Float16.NaN)}","${Float16.NaN}")
        @Expect(Float16.max(Float16(1.23),Float16(1.24)),Float16(1.24))

        @Expect("${Float32.max(Float32(1.23),Float32.NaN)}","${Float32.NaN}")
        @Expect("${Float32.max(Float32.NaN,Float32.NaN)}","${Float32.NaN}")
        @Expect(Float32.max(Float32(1.23),Float32(1.24)),Float32(1.24))

        @Expect("${Float64.max(Float64(1.23),Float64.NaN)}","${Float64.NaN}")
        @Expect("${Float64.max(Float64.NaN,Float64.NaN)}","${Float64.NaN}")
        @Expect(Float64.max(Float64(1.23),Float64(1.24)),Float64(1.24))
    }

    /*
     * Test description: Test min::MathExtension
     * Test API:
     * public func min(a: Int64, b: Int64): Int64
     * public func min(a: Int32, b: Int32): Int32
     * public func min(a: Int16, b: Int16): Int16
     * public func min(a: Int8, b: Int8): Int8
     * public func min(a: UInt64, b: UInt64): UInt64
     * public func min(a: UInt32, b: UInt32): UInt32
     * public func min(a: UInt16, b: UInt16): UInt16
     * public func min(a: UInt8, b: UInt8): UInt8
     * public func min(a: Float64, b: Float64): Float64
     * public func min(a: Float32, b: Float32): Float32
     * public func min(a: Float16, b: Float16): Float16
     */
    @TestCase
    func testMathExtensionMin(): Unit {
        @Expect(min(Int8(-3),Int8(-5)),-5)
        @Expect(min(Int16(-3),Int16(-5)),-5)
        @Expect(min(Int32(-3),Int32(-5)),-5)
        @Expect(min(Int64(-3),Int64(-5)),-5)
        @Expect(min(UInt8(3),UInt8(5)),3)
        @Expect(min(UInt16(3),UInt16(5)),3)
        @Expect(min(UInt32(3),UInt32(5)),3)
        @Expect(min(UInt64(UInt64.Min),UInt64(5)),UInt64.Min)
        @Expect(min(Float16(-4.0),Float16(-3.0)),-4.0)
        @Expect(min(Float32(-4.0),Float32(-3.0)),-4.0)
        @Expect(min(Float64(-4.0),Float64(-3.0)),-4.0)
        @Expect(min(Float64(-4.0),Float64(-3.0),Float64(-3.0)),-4.0)
        @Expect(Float64.min(Float64(-4.0),Float64(-3.0),Float64(-3.0),Float64(-3.0)),-4.0)
        @Expect(Float16.min(Float16(5), Float16.NaN).isNaN())
        @Expect(Float16.min(Float16.NaN, Float16(5)).isNaN())
        @Expect(Float32.min(Float32(5), Float32.NaN).isNaN())
        @Expect(Float32.min(Float32.NaN, Float32(5)).isNaN())
        @Expect(Float64.min(Float64(5), Float64.NaN).isNaN())
        @Expect(Float64.min(Float64.NaN, Float64(5)).isNaN())
        @Expect(Float64.min(Float64.NaN, Float64(5),Float64(5),Float64(5)).isNaN())
    }

    /*
     * Test description: Test Float64.min::MathExtension
     * Test API:
     * public func Float64.min(a: Float64, b: Float64): Float64
     * public func Float64.min(a: Float32, b: Float32): Float32
     * public func Float64.min(a: Float16, b: Float16): Float16
     */
    @TestCase
    func testMathExtensionFloat64Min(): Unit {
        @Expect("${Float16.min(Float16(1.23),Float16.NaN)}","${Float16.NaN}")
        @Expect("${Float16.min(Float16.NaN,Float16.NaN)}","${Float16.NaN}")
        @Expect(Float16.min(Float16(1.23),Float16(1.24)),Float16(1.23))

        @Expect("${Float32.min(Float32(1.23),Float32.NaN)}","${Float32.NaN}")
        @Expect("${Float32.min(Float32.NaN,Float32.NaN)}","${Float32.NaN}")
        @Expect(Float32.min(Float32(1.23),Float32(1.24)),Float32(1.23))

        @Expect("${Float64.min(Float64(1.23),Float64.NaN)}","${Float64.NaN}")
        @Expect("${Float64.min(Float64.NaN,Float64.NaN)}","${Float64.NaN}")
        @Expect(Float64.min(Float64(1.23),Float64(1.24)),Float64(1.23))
    }

    /*
     * Test description: Test reverse::MathExtension
     * Test API:
     * public func reverse(x: UInt64): UInt64
     * public func reverse(x: UInt32): UInt32
     * public func reverse(x: UInt16): UInt16
     * public func reverse(x: UInt8): UInt8
     */
    @TestCase
    func testMathExtensionReverse(): Unit {
        @Expect(reverse(UInt64.Max),18446744073709551615)
        @Expect(reverse(UInt32(0)),0)
        @Expect(reverse(UInt16(121)),40448)
        @Expect(reverse(UInt8(121)),158)
    }

    /*
     * Test description: Test rotate::MathExtension
     * Test API:
     * public func rotate(num: Int64, d: Int8): Int64
     * public func rotate(num: Int32, d: Int8): Int32
     * public func rotate(num: Int16, d: Int8): Int16
     * public func rotate(num: Int8, d: Int8): Int8
     * public func rotate(num: UInt64, d: Int8): UInt64
     * public func rotate(num: UInt32, d: Int8): UInt32
     * public func rotate(num: UInt16, d: Int8): UInt16
     * public func rotate(num: UInt8, d: Int8): UInt8
     *
     */
    @TestCase
    func testMathExtensionRotate(): Unit {
        @Expect(rotate(Int8(92),Int8(4)),-59)
        @Expect(rotate(Int8(92),Int8(-4)),-59)
        @Expect(rotate(Int8(-1),Int8(3)),-1)
        @Expect(rotate(Int8(-64),Int8(-9)),96)

        @Expect(rotate(Int16(92),Int8(4)),1472)
        @Expect(rotate(Int16(92),Int8(-4)),-16379)
        @Expect(rotate(Int16(-1),Int8(3)),-1)
        @Expect(rotate(Int16(-64),Int8(-9)),-8065)

        @Expect(rotate(Int32(1),Int8(4)),16)
        @Expect(rotate(Int32(1),Int8(-4)),268435456)
        @Expect(rotate(Int32(-1),Int8(3)),-1)
        @Expect(rotate(Int32(-64),Int8(-9)),-528482305)

        @Expect(rotate(Int64(1),Int8(4)),16)
        @Expect(rotate(Int64(1),Int8(-4)),1152921504606846976)
        @Expect(rotate(Int64(-1),Int8(3)),-1)
        @Expect(rotate(Int64(-64),Int8(-9)),-2269814212194729985)

        @Expect(rotate(UInt8(2),Int8(0)),2)
        @Expect(rotate(UInt8(2),Int8(-8)),2)
        //边界值int8
        //负数右移，正数左移
        @Expect(rotate(UInt8(1),Int8(-1)),128)
        @Expect(rotate(UInt8(0b00000001),Int8(-1)),128)
        @Expect(rotate(UInt8(8),Int8(-1)),4)
        @Expect(rotate(UInt8(0b00001000),Int8(-1)),4)
        @Expect(rotate(UInt8(2),Int8(1)),4)
        @Expect(rotate(UInt8(0b00000010),Int8(1)) ,4)
        @Expect(rotate(UInt8(128),Int8(1)),1)
        @Expect(rotate(UInt8(0b10000000),Int8(1)),1)
        //特殊值
        //针对于UInt8，num=0,左移右移都是0
        @Expect(rotate(UInt8(0),Int8(-1)), UInt8(0))
        @Expect(rotate(UInt8(0b00000000),Int8(-1)),UInt8(0))
        @Expect(rotate(UInt8(0),Int8(1)),UInt8(0))
        @Expect(rotate(UInt8(0b00000000),Int8(1)),UInt8(0))
        //特殊场景，
        //移动位数超过当前数字位数，循环移动
        @Expect(rotate(UInt8(128),Int8(-9)),UInt8(64))
        @Expect(rotate(UInt8(0b10000000),Int8(-9)), UInt8(64))
        @Expect(rotate(UInt8(128),Int8(9)),UInt8(1))
        @Expect(rotate(UInt8(0b10000000),Int8(9)),UInt8(1))

        @Expect(rotate(UInt16(2),Int8(0)),2)
        @Expect(rotate(UInt16(2),Int8(-16)),2)
        //边界值Int16
        //负数右移，正数左移
        @Expect(rotate(UInt16(1),Int8(-1)) , UInt16(32768))
        @Expect(rotate(UInt16(0b0000000000000001),Int8(-1)) , UInt16(32768))
        @Expect(rotate(UInt16(8),Int8(-1)) , UInt16(4))
        @Expect(rotate(UInt16(0b0000000000001000),Int8(-1)) , UInt16(4))
        @Expect(rotate(UInt16(2),Int8(1)) , UInt16(4))
        @Expect(rotate(UInt16(0b0000000000000010),Int8(1)) , UInt16(4))
        @Expect(rotate(UInt16(32768),Int8(1)) , UInt16(1))
        @Expect(rotate(UInt16(0b1000000000000000),Int8(1)) , UInt16(1))
        //特殊值
        //针对于UInt16，num=0,左移右移都是0
        @Expect(rotate(UInt16(0),Int8(-1)) , UInt16(0))
        @Expect(rotate(UInt16(0b0000000000000000),Int8(-1)) , UInt16(0))
        @Expect(rotate(UInt16(0),Int8(1)) , UInt16(0))
        @Expect(rotate(UInt16(0b0000000000000000),Int8(1)) , UInt16(0))
        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=17等价于d=1,d=-17等价于-1
        @Expect(rotate(UInt16(32768),Int8(-17)) , UInt16(16384))
        @Expect(rotate(UInt16(0b1000000000000000),Int8(-17)) , UInt16(16384))
        @Expect(rotate(UInt16(32768),Int8(17)) , UInt16(1))
        @Expect(rotate(UInt16(0b1000000000000000),Int8(17)) , UInt16(1))

        @Expect(rotate(UInt32(2),Int8(0)),2)
        @Expect(rotate(UInt32(2),Int8(-32)),2)
        //边界值32
        //负数右移，正数左移
        @Expect(rotate(UInt32(1),Int8(-1)) , UInt32(2147483648))
        @Expect(rotate(UInt32(0b00000000000000000000000000000001),Int8(-1)) , UInt32(2147483648))
        @Expect(rotate(UInt32(8),Int8(-1)) , UInt32(4))
        @Expect(rotate(UInt32(0b00000000000000000000000000001000),Int8(-1)) , UInt32(4))
        @Expect(rotate(UInt32(2),Int8(1)) , UInt32(4))
        @Expect(rotate(UInt32(0b00000000000000000000000000000010),Int8(1)) , UInt32(4))
        @Expect(rotate(UInt32(2147483648),Int8(1)) , UInt32(1))
        @Expect(rotate(UInt32(0b10000000000000000000000000000000),Int8(1)) , UInt32(1))
        //特殊值
        //针对于UInt32，num=0,左移右移都是0
        @Expect(rotate(UInt32(0),Int8(-1)) , UInt32(0))
        @Expect(rotate(UInt32(0b00000000000000000000000000000000),Int8(-1)) , UInt32(0))
        @Expect(rotate(UInt32(0),Int8(1)) , UInt32(0))
        @Expect(rotate(UInt32(0b00000000000000000000000000000000),Int8(1)) , UInt32(0))
        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=33等价于d=1,d=-33等价于Int8(-1)
        @Expect(rotate(UInt32(2147483648),Int8(-33)) , UInt32(1073741824))
        @Expect(rotate(UInt32(0b10000000000000000000000000000000),Int8(-33)) , UInt32(1073741824))
        @Expect(rotate(UInt32(2147483648),Int8(33)) , UInt32(1))
        @Expect(rotate(UInt32(0b10000000000000000000000000000000),Int8(33)) , UInt32(1))

        @Expect(rotate(UInt64(2),Int8(0)),2)
        @Expect(rotate(UInt64(2),Int8(-64)),2)
        //边界值int64
        //负数右移，正数左移
        var t64bin: UInt64 = 0b1000000000000000000000000000000000000000000000000000000000000000
        var t64: UInt64 = 9223372036854775808
        @Expect(rotate(UInt64(1),Int8(-1)),t64)
        @Expect(rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000001),Int8(-1)),t64)
        @Expect(rotate(UInt64(8),Int8(-1)) , UInt64(4))
        @Expect(rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000001000),Int8(-1)) , UInt64(4))
        @Expect(rotate(UInt64(2),Int8(1)) , UInt64(4))
        @Expect(rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000010),Int8(1)) , UInt64(4))
        @Expect(rotate(t64,Int8(1)) , UInt64(1))
        @Expect(rotate(t64bin,Int8(1)) , UInt64(1))
        //特殊值
        //针对于UInt64，num=0,左移右移都是0
        @Expect(rotate(UInt64(0),Int8(-1)) , UInt64(0))
        @Expect(rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000),Int8(-1)) , UInt64(0))
        @Expect(rotate(UInt64(0),Int8(1)) , UInt64(0))
        @Expect(rotate(UInt64(0b0000000000000000000000000000000000000000000000000000000000000000),Int8(1)) , UInt64(0))
        //特殊场景，
        //移动位数超过当前数字位数，循环移动,即d=65等价于d=1,d=-65等价于-1
        @Expect(rotate(t64,Int8(-65)) , UInt64(4611686018427387904))
        @Expect(rotate(t64bin,Int8(-65)) , UInt64(4611686018427387904))
        @Expect(rotate(t64,Int8(65)) , UInt64(1))
        @Expect(rotate(t64bin,Int8(65)) , UInt64(1))
    }
    /*
     * Test description: Test trailingZeros::MathExtension
     * Test API:
     * public func trailingZeros(x: Int64): Int64
     * public func trailingZeros(x: Int32): Int64
     * public func trailingZeros(x: Int16): Int64
     * public func trailingZeros(x: Int8): Int64
     * public func trailingZeros(x: UInt64): Int64
     * public func trailingZeros(x: UInt32): Int64
     * public func trailingZeros(x: UInt16): Int64
     * public func trailingZeros(x: UInt8): Int64
     *
     */
    @TestCase
    func testMathExtensionTrailingZeros(): Unit {
        @Expect(trailingZeros(Int8(0)),8)
        @Expect(trailingZeros(Int8(3)),0)
        @Expect(trailingZeros(Int8(-3)),0)
        @Expect(trailingZeros(Int8.Min),7)
        @Expect(trailingZeros(Int8.Max),0)

        @Expect(trailingZeros(Int16(0)),16)
        @Expect(trailingZeros(Int16(3)),0)
        @Expect(trailingZeros(Int16(-3)),0)
        @Expect(trailingZeros(Int16.Min),15)
        @Expect(trailingZeros(Int16.Max),0)

        @Expect(trailingZeros(Int32(0)),32)
        @Expect(trailingZeros(Int32(3)),0)
        @Expect(trailingZeros(Int32(-3)),0)
        @Expect(trailingZeros(Int32.Min),31)
        @Expect(trailingZeros(Int32.Max),0)

        @Expect(trailingZeros(Int64(0)),64)
        @Expect(trailingZeros(Int64(3)),0)
        @Expect(trailingZeros(Int64(-3)),0)
        @Expect(trailingZeros(Int64.Min),63)
        @Expect(trailingZeros(Int64.Max),0)

        @Expect(trailingZeros(UInt64(0)),64)
        @Expect(trailingZeros(UInt64(3)),0)
        @Expect(trailingZeros(UInt64(UInt64.Min)),64)
        @Expect(trailingZeros(UInt64(UInt64.Max)),0)
        @Expect(trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010110)),1)
        @Expect(trailingZeros(UInt64(86)),1)
        @Expect(trailingZeros(UInt64(0b0000000000000000000000000000000000000000000000000000000001010000)),4)
        @Expect(trailingZeros(UInt64(80)),4)

        @Expect(trailingZeros(UInt32(0)),32)
        @Expect(trailingZeros(UInt32(3)),0)
        @Expect(trailingZeros(UInt32(UInt32.Min)),32)
        @Expect(trailingZeros(UInt32(UInt32.Max)),0)
        @Expect(trailingZeros(UInt32(0b00000000000000000000000001010110)),1)
        @Expect(trailingZeros(UInt32(86)),1)
        @Expect(trailingZeros(UInt32(0b00000000000000000000000001010000)),4)
        @Expect(trailingZeros(UInt32(80)),4)

        @Expect(trailingZeros(UInt16(0)),16)
        @Expect(trailingZeros(UInt16(3)),0)
        @Expect(trailingZeros(UInt16(UInt16.Min)),16)
        @Expect(trailingZeros(UInt16(UInt16.Max)),0)
        @Expect(trailingZeros(UInt16(0b0000000001010110)),1)
        @Expect(trailingZeros(UInt16(86)),1)
        @Expect(trailingZeros(UInt16(0b0000000001010000)),4)
        @Expect(trailingZeros(UInt16(80)),4)

        @Expect(trailingZeros(UInt8(0)),8)
        @Expect(trailingZeros(UInt8(3)),0)
        @Expect(trailingZeros(UInt8(UInt8.Min)),8)
        @Expect(trailingZeros(UInt8(UInt8.Max)),0)
        @Expect(trailingZeros(UInt8(0b01010110)),1)
        @Expect(trailingZeros(UInt8(86)),1)
        @Expect(trailingZeros(UInt8(0b01010000)),4)
        @Expect(trailingZeros(UInt8(80)),4)
    }

    /*
     * Test description: Test tan::MathExtension
     * Test API:
     * public func tan(x: Float64): Float64
     * public func tan(x: Float32): Float32
     * public func tan(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionTan(): Unit {
        @Expect("${tan(Float16(6.0))}","-0.291016")
        @Expect("${tan(Float32(6.0))}","-0.291006")
        @Expect("${tan(Float64(6.0))}","-0.291006")
    }

    /*
     * Test description: Test asin::MathExtension
     * Test API:
     * public func asin(x: Float64): Float64
     * public func asin(x: Float32): Float32
     * public func asin(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAsin(): Unit {
        @Expect("${asin(Float64(0.4))}","0.411517")
        @Expect("${asin(Float32(0.4))}","0.411517")
        @Expect("${asin(Float16(0.4))}","0.411377")
    }
    /*
     * Test description: Test asin::MathExtension
     * Test API:
     * public func asin(x: Float64): Float64
     * public func asin(x: Float32): Float32
     * public func asin(x: Float16): Float16
     *
     */
    @TestCase
    func testIncalidMathExtensionAsin(): Unit {
        var caseException01: ?Exception = None
        try {
            asin(Float64(1.4))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testIncalidMathExtensionAsin_01",
            caseException01,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException02: ?Exception = None
        try {
            asin(Float32(1.4))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testIncalidMathExtensionAsin_02",
            caseException02,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException03: ?Exception = None
        try {
            asin(Float16(1.4))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testIncalidMathExtensionAsin_03",
            caseException03,
            "The input parameter is invalid. Please enter a correct parameter."
        )
    }
    /*
     * Test description: Test acos::MathExtension
     * Test API:
     * public func acos(x: Float64): Float64
     * public func acos(x: Float32): Float32
     * public func acos(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAcos(): Unit {
        @Expect("${acos(Float64(0.4))}","1.159279")
        @Expect("${acos(Float32(0.4))}","1.159279")
        @Expect("${acos(Float16(0.4))}","1.159180")
    }
    /*
     * Test description: Test acos::MathExtension
     * Test API:
     * public func acos(x: Float64): Float64
     * public func acos(x: Float32): Float32
     * public func acos(x: Float16): Float16
     *
     */
    @TestCase
    func testInvalidMathExtensionAcos(): Unit {
        var caseException01: ?Exception = None
        try {
            acos(Float64(1.4))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testIncalidMathExtensionAsin_01",
            caseException01,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException02: ?Exception = None
        try {
            acos(Float64(1.4))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAcos_02",
            caseException02,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException03: ?Exception = None
        try {
            acos(Float64(1.4))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAcos_03",
            caseException03,
            "The input parameter is invalid. Please enter a correct parameter."
        )
    }

    /*
     * Test description: Test atan::MathExtension
     * Test API:
     * public func atan(x: Float64): Float64
     * public func atan(x: Float32): Float32
     * public func atan(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAtan(): Unit {
        @Expect("${atan(Float64(3.4))}","1.284745")
        @Expect("${atan(Float32(3.4))}","1.284745")
        @Expect("${atan(Float16(3.4))}","1.285156")
    }
    /*
     * Test description: Test sinh::MathExtension
     * Test API:
     * public func sinh(x: Float64): Float64
     * public func sinh(x: Float32): Float32
     * public func sinh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionSinh(): Unit {
        @Expect("${sinh(Float64(5.4))}","110.700950")
        @Expect("${sinh(Float32(5.4))}","110.700958")
        @Expect("${ sinh(Float16(5.4))}","110.500000")
    }

    /*
     * Test description: Test cosh::MathExtension
     * Test API:
     * public func cosh(x: Float64): Float64
     * public func cosh(x: Float32): Float32
     * public func cosh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionCosh(): Unit {
        @Expect("${cosh(Float64(5.0))}","74.209949")
        @Expect("${cosh(Float32(5.0))}","74.209946")
        @Expect("${cosh(Float16(5.0))}","74.187500")
    }

    /*
     * Test description: Test tanh::MathExtension
     * Test API:
     * public func tanh(x: Float64): Float64
     * public func tanh(x: Float32): Float32
     * public func tanh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionTanh(): Unit {
        @Expect("${tanh(Float64(5.4))}","0.999959")
        @Expect("${tanh(Float32(5.4))}","0.999959")
        @Expect("${tanh(Float16(5.4))}","1.000000")
    }

    /*
     * Test description: Test asinh::MathExtension
     * Test API:
     * public func asinh(x: Float64): Float64
     * public func asinh(x: Float32): Float32
     * public func asinh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAsinh(): Unit {
        @Expect("${asinh(Float64(0.4))}","0.390035")
        @Expect("${asinh(Float32(0.4))}","0.390035")
        @Expect("${asinh(Float16(0.4))}","0.389893")
    }

    /*
     * Test description: Test acosh::MathExtension
     * Test API:
     * public func acosh(x: Float64): Float64
     * public func acosh(x: Float32): Float32
     * public func acosh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAcosh(): Unit {
        @Expect("${acosh(Float64(1.4))}","0.867015")
        @Expect("${acosh(Float32(1.4))}","0.867015")
        @Expect("${acosh(Float16(1.4))}","0.867188")
    }
    /*
     * Test description: Test acosh::MathExtension
     * Test API:
     * public func acosh(x: Float64): Float64
     * public func acosh(x: Float32): Float32
     * public func acosh(x: Float16): Float16
     *
     */
    @TestCase
    func testInvalidMathExtensionAcosh(): Unit {
        var caseException01: ?Exception = None
        try {
            acosh(Float64(0.4))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAcosh_01",
            caseException01,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException02: ?Exception = None
        try {
            acosh(Float32(0.4))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAcosh_02",
            caseException02,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException03: ?Exception = None
        try {
            acosh(Float16(0.4))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAcosh_03",
            caseException03,
            "The input parameter is invalid. Please enter a correct parameter."
        )
    }

    /*
     * Test description: Test atanh::MathExtension
     * Test API:
     * public func atanh(x: Float64): Float64
     * public func atanh(x: Float32): Float32
     * public func atanh(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionAtanh(): Unit {
        @Expect("${atanh(Float64(0.9))}","1.472219")
        @Expect("${atanh(Float32(0.9))}","1.472219")
        @Expect("${atanh(Float16(0.9))}","1.471680")
    }

    /*
     * Test description: Test atanh::MathExtension
     * Test API:
     * public func atanh(x: Float64): Float64
     * public func atanh(x: Float32): Float32
     * public func atanh(x: Float16): Float16
     *
     */
    @TestCase
    func testInvalidMathExtensionAtanh(): Unit {
        var caseException01: ?Exception = None
        try {
            atanh(Float64(1.9))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAtanh_01",
            caseException01,
            "The input parameter is invalid. Please enter a correct parameter."
        )

        var caseException02: ?Exception = None
        try {
            atanh(Float32(1.9))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAtanh_02",
            caseException02,
            "The input parameter is invalid. Please enter a correct parameter."
        )
        var caseException03: ?Exception = None
        try {
            atanh(Float16(1.9))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidMathExtensionAtanh_03",
            caseException03,
            "The input parameter is invalid. Please enter a correct parameter."
        )
    }
    /*
     * Test description: Test round::MathExtension
     * Test API:
     * public func round(x: Float64): Float64
     * public func round(x: Float32): Float32
     * public func round(x: Float16): Float16
     *
     */
    @TestCase
    func testMathExtensionRound(): Unit {
        // < 0.5 舍
        @Expect(round(Float16(0.49)),Float16(0.0))
        @Expect(round(Float32(0.49)), Float32(0.0))
        @Expect(round(Float64(0.49)), Float64(0.0))
        @Expect(round(Float16(-0.49)),Float16(0.0))
        @Expect(round(Float32(-0.49)), Float32(0.0))
        @Expect(round(Float64(-0.49)), Float64(0.0))

        // > 0.5 入
        @Expect(round(Float16(0.51)),Float16(1.0))
        @Expect(round(Float32(0.51)), Float32(1.0))
        @Expect(round(Float64(0.51)), Float64(1.0))
        @Expect(round(Float16(-0.51)),Float16(-1.0))
        @Expect(round(Float32(-0.51)), Float32(-1.0))
        @Expect(round(Float64(-0.51)), Float64(-1.0))

        // == 0.5 偶数 入
        @Expect(round(Float16(1.50)),Float16(2.0))
        @Expect(round(Float32(1.50)), Float32(2.0))
        @Expect(round(Float64(1.50)), Float64(2.0))
        @Expect(round(Float16(-1.50)),Float16(-2.0))
        @Expect(round(Float32(-1.50)), Float32(-2.0))
        @Expect(round(Float64(-1.50)), Float64(-2.0))
        // == 0.5 偶数 舍
        @Expect(round(Float16(2.50)),Float16(2.0))
        @Expect(round(Float32(2.50)), Float32(2.0))
        @Expect(round(Float64(2.50)), Float64(2.0))
        @Expect(round(Float16(-2.50)),Float16(-2.0))
        @Expect(round(Float32(-2.50)), Float32(-2.0))
        @Expect(round(Float64(-2.50)), Float64(-2.0))

        @Expect( round(Float16(1e4) + 1.5), Float16(1e4))
        @Expect( round(Float16(1e3) + 1.5), Float16(1e3) + 2.0)
        @Expect(round(Float32(1e8) + 1.5),  Float32(1e8))
        @Expect( round(Float32(1e7) + 1.5),Float32(1e7) + 2.0)

        @Expect(round(Float64(1e16) + 1.5),  Float64(1e16)+2.0)
        @Expect(round(Float64(1e15) + 1.5) , Float64(1e15) + 2.0)
    }
}
