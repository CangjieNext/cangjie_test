/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

func orderedByComparable<T>(data: Array<T>): Bool where T <: Comparable<T> {
    for (i in 1..data.size) {
        if (data[i - 1].compare(data[i]) == Ordering.GT) {
            return false
        }
    }
    return true
}

main(): Int64 {
    var f16: Array<Float16> = [Float16.NaN, Float16.Inf, -0.0, 0.0, -Float16.Inf, 1.0, -1.0]
    var f32: Array<Float32> = [Float32.NaN, Float32.Inf, -0.0, 0.0, -Float32.Inf, 1.0, -1.0]
    var f64: Array<Float64> = [Float64.NaN, Float64.Inf, -0.0, 0.0, -Float64.Inf, 1.0, -1.0]
    stableSort(f16)
    unstableSort(f32)
    stableSort(f64)
    if (!orderedByComparable(f16)) { return 1 }
    if (!orderedByComparable(f32)) { return 2 }
    if (!orderedByComparable(f64)) { return 3 }
    return 0
}
