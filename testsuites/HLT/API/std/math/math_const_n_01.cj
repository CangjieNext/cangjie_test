/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    //expect Min Float value
    var exp_MinFloat16: Float16 = -6.5504e4
    var exp_MinDenormalFloat16: Float16 = 5.9604645e-8 //5.9604644775390625e-8 //最小次正规数*
    var exp_MinNormalFloat16: Float16 = 6.103515625e-5 //6.103515625e-5 //最小正规数*

    var exp_MinFloat32: Float32 = -3.4028235e38 //-3.4028234663852885981e38
    var exp_MinDenormalFloat32: Float32 = 1.4012984643e-45 //1.4012984643248170709e-45*
    var exp_MinNormalFloat32: Float32 = 1.1754943508e-38 //1.175494350822287508e-38*

    var exp_MinFloat64: Float64 = -1.7976931348623157e308 //-1.7976931348623157081e308
    var exp_MinDenormalFloat64: Float64 = 4.9406564584124654e-324 //4.9406564584124654418e-324*
    var exp_MinNormalFloat64: Float64 = 2.2250738585072014e-308 //2.2250738585072013831e-308*

    //expect Max Float value
    var exp_MaxFloat16: Float16 = 6.5504e4
    var exp_MaxFloat32: Float32 = 3.4028235e38
    var exp_MaxFloat64: Float64 = 1.7976931348623157e308
    //expect E value
    var exp_E64: Float64 = 2.71828182845904523536
    var exp_E16: Float16 = 2.71828182845904523536
    var exp_E32: Float32 = 2.71828182845904523536
    //expect pi value
    var exp_PI64: Float64 = 3.141592653589793
    var exp_PI32: Float32 = 3.141592653589793
    var exp_PI16: Float16 = 3.141592653589793
    //actual Max Int value
    var MaxInt8 = Int8.Max
    var MaxInt16 = Int16.Max
    var MaxInt32 = Int32.Max
    var MaxInt64 = Int64.Max
    //actual max UInt value
    var MaxUInt8 = UInt8.Max
    var MaxUInt16 = UInt16.Max
    var MaxUInt32 = UInt32.Max
    var MaxUInt64 = UInt64.Max
    //actual Min Int value
    var MinInt8 = Int8.Min
    var MinInt16 = Int16.Min
    var MinInt32 = Int32.Min
    var MinInt64 = Int64.Min
    //actual Min UInt value
    var MinUInt8 = UInt8.Min
    var MinUInt16 = UInt16.Min
    var MinUInt32 = UInt32.Min
    var MinUInt64 = UInt64.Min
    //expect Min int value
    var exp_MinInt8: Int8 = -128
    var exp_MinInt16: Int16 = -32768
    var exp_MinInt32: Int32 = -2147483648
    var exp_MinInt64: Int64 = -9223372036854775808
    //expect Max int value
    var exp_MaxInt8: Int8 = 127
    var exp_MaxInt16: Int16 = 32767
    var exp_MaxInt32: Int32 = 2147483647
    var exp_MaxInt64: Int64 = 9223372036854775807
    //expect min UInt value
    var exp_MinUInt8: UInt8 = 0
    var exp_MinUInt16: UInt16 = 0
    var exp_MinUInt32: UInt32 = 0
    var exp_MinUInt64: UInt64 = 0
    //expect Max UInt value
    var exp_MaxUInt8: UInt8 = 255
    var exp_MaxUInt16: UInt16 = 65535
    var exp_MaxUInt32: UInt32 = 4294967295
    var exp_MaxUInt64: UInt64 = 18446744073709551615
    let E_16 = Float16.GetE()
    let E_32 = Float32.GetE()
    let E_64 = Float64.GetE()

    let PI_16 = Float16.GetPI()
    let PI_32 = Float32.GetPI()
    let PI_64 = Float64.GetPI()

    CaseRunner<Float16>().runCases(
        [
            (Float16.Min, exp_MinFloat16, Float16(0.0001)),
            (Float16.MinDenormal, exp_MinDenormalFloat16, Float16(1e-14)),
            (Float16.MinNormal, exp_MinNormalFloat16, Float16(1e-14)),
            (Float16.Max, exp_MaxFloat16, Float16(0.0001)),
            (E_16, exp_E16, Float16(0.0001)),
            (PI_16, exp_PI16, Float16(0.0001))
        ],
        description: "判断Float16类型常量与预期结果一致"
    )
    CaseRunner<Float32>().runCases(
        [
            (Float32.Min, exp_MinFloat32, Float32(1e-45)),
            (Float32.MinDenormal, exp_MinDenormalFloat32, Float32(1e-55)),
            (Float32.MinNormal, exp_MinNormalFloat32, Float32(1e-48)),
            (Float32.Max, exp_MaxFloat32, Float32(0.0001)),
            (E_32, exp_E32, Float32(0.0001)),
            (PI_32, exp_PI32, Float32(0.0001))
        ],
        description: "判断Float32类型常量与预期结果一致"
    )
    CaseRunner<Float64>().runCases(
        [
            (Float64.Min, exp_MinFloat64, Float64(1e-324)),
            (Float64.MinDenormal, exp_MinDenormalFloat64, Float64(1e-340)),
            (Float64.MinNormal, exp_MinNormalFloat64, Float64(1e-324)),
            (Float64.Max, exp_MaxFloat64, Float64(0.0001)),
            (E_64, exp_E64, Float64(0.0001)),
            (PI_64, exp_PI64, Float64(0.0001))
        ],
        description: "判断Float64类型常量与预期结果一致"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            Float16.NaN.isNaN(),
            Float32.NaN.isNaN(),
            Float64.NaN.isNaN()
        ],
        description: "判断nan常量与预期结果一致"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            Float16.Inf.isInf(),
            Float32.Inf.isInf(),
            Float64.Inf.isInf()
        ],
        description: "判断Inf常量与预期结果一致"
    )
    CaseRunner<Int8>().runCases(
        [
            (Int8.Min, exp_MinInt8),
            (Int8.Max, exp_MaxInt8)
        ],
        description: "判断Int8相关常量与预期结果一致"
    )
    CaseRunner<Int16>().runCases(
        [
            (Int16.Min, exp_MinInt16),
            (Int16.Max, exp_MaxInt16)
        ],
        description: "判断Int16相关常量与预期结果一致"
    )
    CaseRunner<Int32>().runCases(
        [
            (Int32.Min, exp_MinInt32),
            (Int32.Max, exp_MaxInt32)
        ],
        description: "判断Int32相关常量与预期结果一致"
    )
    CaseRunner<Int64>().runCases(
        [
            (Int64.Min, exp_MinInt64),
            (Int64.Max, exp_MaxInt64)
        ],
        description: "判断Int64相关常量与预期结果一致"
    )
    CaseRunner<UInt8>().runCases(
        [
            (UInt8.Min, exp_MinUInt8),
            (UInt8.Max, exp_MaxUInt8)
        ],
        description: "判断UInt8相关常量与预期结果一致"
    )
    CaseRunner<UInt16>().runCases(
        [
            (UInt16.Min, exp_MinUInt16),
            (UInt16.Max, exp_MaxUInt16)
        ],
        description: "判断UInt16相关常量与预期结果一致"
    )
    CaseRunner<UInt32>().runCases(
        [
            (UInt32.Min, exp_MinUInt32),
            (UInt32.Max, exp_MaxUInt32)
        ],
        description: "判断UInt32相关常量与预期结果一致"
    )
    CaseRunner<UInt64>().runCases(
        [
            (UInt64.Min, exp_MinUInt64),
            (UInt64.Max, exp_MaxUInt64)
        ],
        description: "判断UInt64相关常量与预期结果一致"
    )
    return 0
}
