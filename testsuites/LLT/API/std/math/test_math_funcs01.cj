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
class MathTest {
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
     * Test description: Test Abs ::MathExtension
     * Test API:
     * public func abs(x: Int64): Int64
     * public func abs(x: Int32): Int32
     * public func abs(x: Int16): Int8
     * public func abs(x: Int8): Int8
     * public func abs(x: Float64): Float64
     * public func abs(x: Float32): Float32
     * public func abs(x: Float16): Float16
     *
     */
    @TestCase
    func testAbs(): Unit {
        @Expect(abs(Int8.Min+1),-(Int8.Min+1)) //x:min+
        @Expect(abs(Int8(-68)),Int8(68)) //x:正常负数
        @Expect(abs(Int8(-0)),Int8(0)) //x:特殊值
        @Expect(abs(Int8(0)),Int8(0)) //x:特殊值
        @Expect(abs(Int8(23)),Int8(23)) //x:正常正数
        @Expect(abs(Int8.Max-1),Int8.Max-1) //x:max-
        @Expect(abs(Int8.Max),Int8.Max) //x:max

        @Expect(abs(Int16.Min+1),-(Int16.Min+1)) //x:min+
        @Expect(abs(Int16(-68)),Int16(68)) //x:正常负数
        @Expect(abs(Int16(-0)),Int16(0)) //x:特殊值
        @Expect(abs(Int16(0)),Int16(0)) //x:特殊值
        @Expect(abs(Int16(23)),Int16(23)) //x:正常正数
        @Expect(abs(Int16.Max-1),Int16.Max-1) //x:max-
        @Expect(abs(Int16.Max),Int16.Max) //x:max

        @Expect(abs(Int32.Min+1),-(Int32.Min+1)) //x:min+
        @Expect(abs(Int32(-68)),Int32(68)) //x:正常负数
        @Expect(abs(Int32(-0)),Int32(0)) //x:特殊值
        @Expect(abs(Int32(0)),Int32(0)) //x:特殊值
        @Expect(abs(Int32(23)),Int32(23)) //x:正常正数
        @Expect(abs(Int32.Max-1),Int32.Max-1) //x:max-
        @Expect(abs(Int32.Max),Int32.Max) //x:max

        @Expect(abs(Int64.Min+1),-(Int64.Min+1)) //x:min+
        @Expect(abs(Int64(-68)),Int64(68)) //x:正常负数
        @Expect(abs(Int64(-0)),Int64(0)) //x:特殊值
        @Expect(abs(Int64(0)),Int64(0)) //x:特殊值
        @Expect(abs(Int64(23)),Int64(23)) //x:正常正数
        @Expect(abs(Int64.Max-1),Int64.Max-1) //x:max-
        @Expect(abs(Int64.Max),Int64.Max) //x:max

        @Expect(abs(Float16.Inf).isInf())
        @Expect(abs(-Float16.Inf).isInf())
        @Expect(abs(Float16.NaN).isNaN())
        @Expect(abs(-Float16.NaN).isNaN())
        @Expect(abs(Float16(-956.000000)),Float16(956.000000))
        @Expect(abs(Float16(956.000000)),Float16(956.000000))

        @Expect(abs(Float32.Inf).isInf())
        @Expect(abs(-Float32.Inf).isInf())
        @Expect(abs(Float32.NaN).isNaN())
        @Expect(abs(-Float32.NaN).isNaN())
        @Expect(abs(Float32(-956.000000)),Float32(956.000000))
        @Expect(abs(Float32(956.000000)),Float32(956.000000))

        @Expect(abs(Float64.Inf).isInf())
        @Expect(abs(-Float64.Inf).isInf())
        @Expect(abs(Float64.NaN).isNaN())
        @Expect(abs(-Float64.NaN).isNaN())
        @Expect(abs(Float64(-956.000000)),Float64(956.000000))
        @Expect(abs(Float64(956.000000)),Float64(956.000000))
    }

    /*
     * Test description: Test Abs ::MathExtension
     * Test API:
     * public func abs(x: Int64): Int64
     * public func abs(x: Int32): Int32
     * public func abs(x: Int16): Int8
     * public func abs(x: Int8): Int8
     *
     */
    @TestCase
    func testInvalidAbs(): Unit {
        var caseException01: ?Exception = None
        try {
            abs(Int64.Min)
        } catch (e: OverflowException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidAbs_01",
            caseException01,
            "The absolute value of the minimum Int64 value is out of range."
        )
        var caseException02: ?Exception = None
        try {
            abs(Int32.Min)
        } catch (e: OverflowException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidAbs_02",
            caseException02,
            "The absolute value of the minimum Int32 value is out of range."
        )
        var caseException03: ?Exception = None
        try {
            abs(Int32.Min)
        } catch (e: OverflowException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidAbs_03",
            caseException03,
            "The absolute value of the minimum Int32 value is out of range."
        )
    }

    /*
     * Test description: Test sqrt ::MathExtension
     * Test API:
     * public func sqrt(x: Float64): Float64
     * public func sqrt(x: Float32): Float32
     * public func sqrt(x: Float16): Float16
     *
     */
    @TestCase
    func testSqrt(): Unit {
        @Expect("${sqrt(Float16(2.0))}","1.414062")
        @Expect("${sqrt(Float32(2.0))}","1.414214")
        @Expect("${sqrt(Float64(2.0))}","1.414214")
    }

    /*
     * Test description: Test sqrt ::MathExtension
     * Test API:
     * public func sqrt(x: Float64): Float64
     * public func sqrt(x: Float32): Float32
     * public func sqrt(x: Float16): Float16
     *
     */
    @TestCase
    func testInvalidSqrt(): Unit {
        var caseException01: ?Exception = None
        try {
            sqrt(Float16(-2.0))
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidSqrt_01",
            caseException01,
            "The input parameter must be greater than or equal to 0.0. Please enter a correct parameter."
        )
        var caseException02: ?Exception = None
        try {
            sqrt(Float32(-2.0))
        } catch (e: IllegalArgumentException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidSqrt_02",
            caseException02,
            "The input parameter must be greater than or equal to 0.0. Please enter a correct parameter."
        )
        var caseException03: ?Exception = None
        try {
            sqrt(Float64(-2.0))
        } catch (e: IllegalArgumentException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidSqrt_03",
            caseException03,
            "The input parameter must be greater than or equal to 0.0. Please enter a correct parameter."
        )
    }

    /*
     * Test description: Test exp ::MathExtension
     * Test API:
     * public func exp(x: Float64): Float64
     * public func exp(x: Float32): Float32
     * public func exp(x: Float16): Float16
     *
     */
    @TestCase
    func testExp(): Unit {
        @Expect("${exp(Float16(-2.0))}","0.135376")
        @Expect("${exp(Float32(-2.0))}","0.135335")
        @Expect("${exp(Float64(-2.0))}","0.135335")
    }

    /*
     * Test description: Test exp2 ::MathExtension
     * Test API:
     * public func exp2(x: Float64): Float64
     * public func exp2(x: Float32): Float32
     * public func exp2(x: Float16): Float16
     *
     */
    @TestCase
    func testExp2(): Unit {
        @Expect("${exp2(Float16(-2.0))}","0.250000")
        @Expect("${exp2(Float32(-2.0))}","0.250000")
        @Expect("${exp2(Float64(-2.0))}","0.250000")
    }

    /*
     * Test description: Test log10 ::MathExtension
     * Test API:
     * public func log10(x: Float64): Float64
     * public func log10(x: Float32): Float32
     * public func log10(x: Float16): Float16
     *
     */
    @TestCase
    func testLog10(): Unit {
        @Expect("${log10(Float64(3.0))}","0.477121")
        @Expect("${log10(Float32(3.0))}","0.477121")
        @Expect("${log10(Float16(3.0))}","0.477051")
    }
    /*
     * Test description: Test log10 ::MathExtension
     * Test API:
     * public func log10(x: Float64): Float64
     * public func log10(x: Float32): Float32
     * public func log10(x: Float16): Float16
     *
     */
    @TestCase
    func testLog10SpecValue(): Unit {
        @Expect(log10(Float64.Inf).isInf())
        @Expect(log10(Float64(0.0)).isInf())
        @Expect(log10(Float64(-1.0)).isNaN())
        @Expect(log10(Float64.NaN).isNaN())
        @Expect(log10(-Float64.Inf).isNaN())
        @Expect("${log10(Float64.Inf)}","inf")
        @Expect("${log10(Float32.Inf)}","inf")
        @Expect("${log10(Float16.Inf)}","inf")
        @Expect("${log10(Float64(0.0))}","-inf")
        @Expect("${log10(Float32(0.0))}","-inf")
        @Expect("${log10(Float16(0.0))}","-inf")
        @Expect("${log10(Float64.NaN)}","nan")
        @Expect("${log10(Float32.NaN)}","nan")
        @Expect("${log10(Float16.NaN)}","nan")
        @Expect("${log10(-Float64.Inf)}","nan")
        @Expect("${log10(-Float32.Inf)}","nan")
        @Expect("${log10(-Float16.Inf)}","nan")
        @Expect("${log10(-2.0f64)}","nan")
        @Expect("${log10(-2.0f32)}","nan")
        @Expect("${log10(-2.0f16)}","nan")
        @Expect(log10(1.0f64),Float64(0.0))
        @Expect(log10(1.0f32),Float32(0.0))
        @Expect(log10(1.0f16),Float16(0.0))
    }

    /*
     * Test description: Test log2 ::MathExtension
     * Test API:
     * public func log2(x: Float64): Float64
     * public func log2(x: Float32): Float32
     * public func log2(x: Float16): Float16
     *
     */
    @TestCase
    func testLog2(): Unit {
        @Expect("${log2(Float64(4.0))}","2.000000")
        @Expect("${log2(Float32(4.0))}","2.000000")
        @Expect("${log2(Float16(4.0))}","2.000000")
    }
    /*
     * Test description: Test log2 ::MathExtension
     * Test API:
     * public func log2(x: Float64): Float64
     * public func log2(x: Float32): Float32
     * public func log2(x: Float16): Float16
     *
     */
    @TestCase
    func testLog2SpecValue(): Unit {
        @Expect(log2(Float64.Inf).isInf())
        @Expect(log2(Float64(0.0)).isInf())
        @Expect(log2(Float64(-1.0)).isNaN())
        @Expect(log2(Float64.NaN).isNaN())
        @Expect(log2(-Float64.Inf).isNaN())
        @Expect("${log2(Float64.Inf)}","inf")
        @Expect("${log2(Float32.Inf)}","inf")
        @Expect("${log2(Float16.Inf)}","inf")
        @Expect("${log2(Float64(0.0))}","-inf")
        @Expect("${log2(Float32(0.0))}","-inf")
        @Expect("${log2(Float16(0.0))}","-inf")
        @Expect("${log2(Float64.NaN)}","nan")
        @Expect("${log2(Float32.NaN)}","nan")
        @Expect("${log2(Float16.NaN)}","nan")
        @Expect("${log2(-Float64.Inf)}","nan")
        @Expect("${log2(-Float32.Inf)}","nan")
        @Expect("${log2(-Float16.Inf)}","nan")
        @Expect("${log2(-2.0f64)}","nan")
        @Expect("${log2(-2.0f32)}","nan")
        @Expect("${log2(-2.0f16)}","nan")
        @Expect(log2(1.0f64),Float64(0.0))
        @Expect(log2(1.0f32),Float32(0.0))
        @Expect(log2(1.0f16),Float16(0.0))
    }
    /*
     * Test description: Test log ::MathExtension
     * Test API:
     * public func log(x: Float64): Float64
     * public func log(x: Float32): Float32
     * public func log(x: Float16): Float16
     *
     */
    @TestCase
    func testLog(): Unit {
        @Expect("${log(Float16(5.4))}","1.686523")
        @Expect("${log(Float32(5.4))}","1.686399")
        @Expect("${log(Float64(5.4))}","1.686399")
    }
    /*
     * Test description: Test log ::MathExtension
     * Test API:
     * public func log(x: Float64): Float64
     * public func log(x: Float32): Float32
     * public func log(x: Float16): Float16
     *
     */
    @TestCase
    func testLogSpecValue(): Unit {
        @Expect(log(Float64.Inf).isInf())
        @Expect(log(Float64(0.0)).isInf())
        @Expect(log(Float64(-1.0)).isNaN())
        @Expect(log(Float64.NaN).isNaN())
        @Expect(log(-Float64.Inf).isNaN())
        @Expect("${log(Float64.Inf)}","inf")
        @Expect("${log(Float32.Inf)}","inf")
        @Expect("${log(Float16.Inf)}","inf")
        @Expect("${log(Float64(0.0))}","-inf")
        @Expect("${log(Float32(0.0))}","-inf")
        @Expect("${log(Float16(0.0))}","-inf")
        @Expect("${log(Float64.NaN)}","nan")
        @Expect("${log(Float32.NaN)}","nan")
        @Expect("${log(Float16.NaN)}","nan")
        @Expect("${log(-Float64.Inf)}","nan")
        @Expect("${log(-Float32.Inf)}","nan")
        @Expect("${log(-Float16.Inf)}","nan")
        @Expect("${log(-2.0f64)}","nan")
        @Expect("${log(-2.0f32)}","nan")
        @Expect("${log(-2.0f16)}","nan")
        @Expect(log(1.0f64),Float64(0.0))
        @Expect(log(1.0f32),Float32(0.0))
        @Expect(log(1.0f16),Float16(0.0))
    }
    /*
     * Test description: Test floor ::MathExtension
     * Test API:
     * public func floor(x: Float64): Float64
     * public func floor(x: Float32): Float32
     * public func floor(x: Float16): Float16
     *
     */
    @TestCase
    func testFloor(): Unit {
        @Expect(floor(Float16(0.0)),Float16(0.000000))
        @Expect(floor(Float16(3.5)),Float16(3.000000))
        @Expect(floor(Float32(3.5)),Float32(3.000000))
        @Expect(floor(Float64(3.5)),Float64(3.000000))
    }

    /*
     * Test description: Test ceil ::MathExtension
     * Test API:
     * public func ceil(x: Float64): Float64
     * public func ceil(x: Float32): Float32
     * public func ceil(x: Float16): Float16
     *
     */
    @TestCase
    func testCeil(): Unit {
        @Expect(ceil(Float16(0.0)),Float16(0.000000))
        @Expect(ceil(Float16(3.5)),Float16(4.000000))
        @Expect(ceil(Float32(3.5)),Float32(4.000000))
        @Expect(ceil(Float64(3.5)),Float64(4.000000))
    }
    /*
     * Test description: Test trunc ::MathExtension
     * Test API:
     * public func trunc(x: Float64): Float64
     * public func trunc(x: Float32): Float32
     * public func trunc(x: Float16): Float16
     *
     */
    @TestCase
    func testTrunc(): Unit {
        @Expect(trunc(Float16(0.0123)),Float16(0.000000))
        @Expect(trunc(Float16(3.534)),Float16(3.000000))
        @Expect(trunc(Float32(3.534)),Float32(3.000000))
        @Expect(trunc(Float64(3.534)),Float64(3.000000))
        @Expect(trunc(Float16.Inf).isInf())
        @Expect(trunc(-Float16.Inf).isInf())
        @Expect(trunc(Float32.Inf).isInf())
        @Expect(trunc(-Float32.Inf).isInf())
        @Expect(trunc(Float64.Inf).isInf())
        @Expect(trunc(-Float64.Inf).isInf())
    }
    /*
     * Test description: Test sin ::MathExtension
     * Test API:
     * public func sin(x: Float64): Float64
     * public func sin(x: Float32): Float32
     * public func sin(x: Float16): Float16
     *
     */
    @TestCase
    func testSin(): Unit {
        @Expect("${sin(Float64(5.0))}","-0.958924")
        @Expect("${sin(Float32(5.0))}","-0.958924")
        @Expect("${sin(Float16(5.0))}","-0.958984")
    }

    /*
     * Test description: Test cos ::MathExtension
     * Test API:
     * public func cos(x: Float64): Float64
     * public func cos(x: Float32): Float32
     * public func cos(x: Float16): Float16
     *
     */
    @TestCase
    func testCos(): Unit {
        @Expect("${cos(Float64(5.0))}","0.283662")
        @Expect("${cos(Float32(5.0))}","0.283662")
        @Expect("${cos(Float16(5.0))}","0.283691")
    }
}
