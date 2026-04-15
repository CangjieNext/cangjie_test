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

struct Float32InitStruct {
    public let input: Float32
    public let expectOutput: String

    Float32InitStruct(input: Float32, expectOutput: String) {
        this.input = input
        this.expectOutput = expectOutput
    }
}

func verifyFloat32Init(testStruct: Float32InitStruct): Bool {
    var decimalStr: String
    try {
        let d = Decimal(testStruct.input)
        decimalStr = d.toString()
    } catch (e: OverflowException) {
        decimalStr = "OverflowException"
    } catch (e: IllegalArgumentException) {
        decimalStr = e.message
    } catch (e: Exception) {
        decimalStr = e.message
    }

    if (decimalStr == testStruct.expectOutput) {
        return true
    } else {
        println("FAIL: input=${testStruct.input}, expected=${testStruct.expectOutput}, actual=${decimalStr}")
        return false
    }
}

let float32NormalArray: Array<Float32InitStruct> = [
    Float32InitStruct(0.0f32, "0"),
    Float32InitStruct(1.0f32, "1"),
    Float32InitStruct(-1.0f32, "-1"),
    Float32InitStruct(0.5f32, "0.5"),
    Float32InitStruct(0.25f32, "0.25"),
    Float32InitStruct(0.125f32, "0.125"),
    Float32InitStruct(0.1f32, "0.100000001490116119384765625"),
    Float32InitStruct(-12.48606811663f32, "-12.48606777191162109375"),
    Float32InitStruct(3.0f32, "3"),
    Float32InitStruct(Float32.Max, "340282346638528859811704183484516925440"),
    Float32InitStruct(Float32.Min, "-340282346638528859811704183484516925440")
]

let float32SpecialArray: Array<Float32InitStruct> = [
    Float32InitStruct(Float32.NaN, "Float value cannot be Inf or NaN."),
    Float32InitStruct(Float32.Inf, "Float value cannot be Inf or NaN."),
    Float32InitStruct(-Float32.Inf, "Float value cannot be Inf or NaN.")
]

@Test
class DecimalFloat32InitTest {
    @TestCase
    func float32NormalInit(): Unit {
        for (i in float32NormalArray) {
            @Expect(verifyFloat32Init(i), true)
        }
    }

    @TestCase
    func float32SpecialInit(): Unit {
        for (i in float32SpecialArray) {
            @Expect(verifyFloat32Init(i), true)
        }
    }

    @TestCase
    func float32MinNormalScaleNotOverflow(): Unit {
        var caught = false
        var resultScale: Int32 = 0
        try {
            let d = Decimal(Float32.MinNormal)
            resultScale = d.scale
        } catch (e: OverflowException) {
            caught = true
        }
        @Expect(caught, false)
        @Expect(resultScale, 126)
    }

    @TestCase
    func float32MinDenormalScaleNotOverflow(): Unit {
        var caught = false
        var resultScale: Int32 = 0
        try {
            let d = Decimal(Float32.MinDenormal)
            resultScale = d.scale
        } catch (e: OverflowException) {
            caught = true
        }
        @Expect(caught, false)
        @Expect(resultScale, 149)
    }

    @TestCase
    func float32ScaleConsistencyWithFloat64(): Unit {
        let f32Val = 0.1f32
        let f64Val = Float64(f32Val)
        let d32 = Decimal(f32Val)
        let d64 = Decimal(f64Val)
        let consistent = d32 == d64
        if (!consistent) {
            println("Float32 Decimal: ${d32.toString()}")
            println("Float64 Decimal: ${d64.toString()}")
        }
        @Expect(consistent, true)
    }

    @TestCase
    func float32ZeroInit(): Unit {
        let d = Decimal(0.0f32)
        @Expect(d.scale, 0)
        @Expect(d.sign, 0)
    }

    @TestCase
    func float32NegativeZeroInit(): Unit {
        let d = Decimal(-0.0f32)
        @Expect(d.scale, 0)
        @Expect(d.sign, 0)
    }

    @TestCase
    func float32PowersOfTwo(): Unit {
        let d1 = Decimal(0.5f32)
        @Expect(d1.scale, 1)
        @Expect(d1.toString(), "0.5")

        let d2 = Decimal(0.25f32)
        @Expect(d2.scale, 2)
        @Expect(d2.toString(), "0.25")

        let d3 = Decimal(0.125f32)
        @Expect(d3.scale, 3)
        @Expect(d3.toString(), "0.125")
    }
}
