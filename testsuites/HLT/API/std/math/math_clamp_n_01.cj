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
    CaseRunner<Float16>().runCases(
        [
            (clamp(Float16(5.83), Float16(3.98), Float16(9.45)), Float16(5.83), Float16(0.0001)), //min<x<max
            (clamp(Float16(-5.83), Float16(-10.98), Float16(-3.45)), Float16(-5.83), Float16(0.0001)), //min<x<max
            (clamp(Float16(5.83), Float16(8.98), Float16(9.45)), Float16(8.98), Float16(0.0001)), //x<min
            (clamp(Float16(-5.83), Float16(8.98), Float16(9.45)), Float16(8.98), Float16(0.0001)), //x<min
            (clamp(Float16(45.83), Float16(8.98), Float16(9.45)), Float16(9.45), Float16(0.0001)), //x>max
            (clamp(Float16(-45.83), Float16(-128.98), Float16(-99.45)), Float16(-99.45), Float16(0.0001)), //x>max
            (clamp(Float16(5.83), Float16(-inf16), Float16(inf16)), Float16(5.83), Float16(0.0001)), //x,y均是inf
            (clamp(Float16(inf16), Float16(3.98), Float16(9.45)), Float16(9.45), Float16(0.0001)),
            (clamp(Float16(5.83), Float16(-inf16), Float16(9.45)), Float16(5.83), Float16(0.0001)),
            (clamp(Float16(5.83), Float16(8.98), Float16(inf16)), Float16(8.98), Float16(0.0001))
        ],
        description: "clamp（）函数入参是Float16，且min<max"
    )
    CaseRunner<Float32>().runCases(
        [
            (clamp(Float32(5.83), Float32(3.98), Float32(9.45)), Float32(5.83), Float32(0.0001)), //min<x<max
            (clamp(Float32(-5.83), Float32(-10.98), Float32(-3.45)), Float32(-5.83), Float32(0.0001)), //min<x<max
            (clamp(Float32(5.83), Float32(8.98), Float32(9.45)), Float32(8.98), Float32(0.0001)), //x<min
            (clamp(Float32(-5.83), Float32(8.98), Float32(9.45)), Float32(8.98), Float32(0.0001)), //x<min
            (clamp(Float32(45.83), Float32(8.98), Float32(9.45)), Float32(9.45), Float32(0.0001)), //x>max
            (clamp(Float32(-45.83), Float32(-128.98), Float32(-99.45)), Float32(-99.45), Float32(0.0001)), //x>max
            (clamp(Float32(5.83), Float32(-inf32), Float32(inf32)), Float32(5.83), Float32(0.0001)), //x,y均是inf
            (clamp(Float32(inf32), Float32(3.98), Float32(9.45)), Float32(9.45), Float32(0.0001)),
            (clamp(Float32(5.83), Float32(-inf32), Float32(9.45)), Float32(5.83), Float32(0.0001)),
            (clamp(Float32(5.83), Float32(8.98), Float32(inf32)), Float32(8.98), Float32(0.0001))
        ],
        description: "clamp（）函数入参是Float32，且min<max"
    )
    CaseRunner<Float64>().runCases(
        [
            (clamp(Float64(5.83), Float64(3.98), Float64(9.45)), Float64(5.83), Float64(0.0001)), //min<x<max
            (clamp(Float64(-5.83), Float64(-10.98), Float64(-3.45)), Float64(-5.83), Float64(0.0001)), //min<x<max
            (clamp(Float64(5.83), Float64(8.98), Float64(9.45)), Float64(8.98), Float64(0.0001)), //x<min
            (clamp(Float64(-5.83), Float64(8.98), Float64(9.45)), Float64(8.98), Float64(0.0001)), //x<min
            (clamp(Float64(45.83), Float64(8.98), Float64(9.45)), Float64(9.45), Float64(0.0001)), //x>max
            (clamp(Float64(-45.83), Float64(-128.98), Float64(-99.45)), Float64(-99.45), Float64(0.0001)), //x>max
            (clamp(Float64(5.83), Float64(-inf64), Float64(inf64)), Float64(5.83), Float64(0.0001)),
            (clamp(Float64(inf64), Float64(3.98), Float64(9.45)), Float64(9.45), Float64(0.0001)),
            (clamp(Float64(5.83), Float64(-inf64), Float64(9.45)), Float64(5.83), Float64(0.0001)),
            (clamp(Float64(5.83), Float64(8.98), Float64(inf64)), Float64(8.98), Float64(0.0001))
        ],
        description: "clamp（）函数入参是Float64，且min<max"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            clamp(Float16(nan16), Float16(3.98), Float16(9.45)).isNaN(),
            clamp(Float32(nan32), Float32(8.98), Float32(9.45)).isNaN(),
            clamp(Float64(nan64), Float64(3.98), Float64(9.45)).isNaN()
        ],
        description: "v是nan，返回nan"
    )

    return 0
}
