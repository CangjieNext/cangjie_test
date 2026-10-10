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

func makeBoundaryData<T>(size: Int64, low: T, middle: T, high: T): Array<T> {
    let data = Array<T>(size, repeat: middle)
    for (i in 0..size) {
        match (i % 6) {
            case 0 => data[i] = high
            case 1 => data[i] = low
            case 2 => data[i] = middle
            case 3 => data[i] = high
            case 4 => data[i] = middle
            case _ => data[i] = low
        }
    }
    return data
}

func isOrdered<T>(data: Array<T>): Bool where T <: Comparable<T> {
    for (i in 1..data.size) {
        if (data[i - 1].compare(data[i]) == Ordering.GT) {
            return false
        }
    }
    return true
}

func checkBoundaryLengths<T>(low: T, middle: T, high: T): Bool where T <: Comparable<T> {
    let lengths: Array<Int64> = [0, 1, 2, 15, 16, 17, 63, 64, 65, 257]
    for (size in lengths) {
        let unstableData = makeBoundaryData(size, low, middle, high)
        let stableData = makeBoundaryData(size, low, middle, high)
        unstableSort(unstableData)
        stableSort(stableData)
        if (!isOrdered(unstableData) || !isOrdered(stableData) || unstableData != stableData) {
            return false
        }
    }
    return true
}

main(): Int64 {
    if (!checkBoundaryLengths(Int8(-3), Int8(1), Int8(5))) { return 1 }
    if (!checkBoundaryLengths(Int16(-3), Int16(1), Int16(5))) { return 2 }
    if (!checkBoundaryLengths(Int32(-3), Int32(1), Int32(5))) { return 3 }
    if (!checkBoundaryLengths(Int64(-3), Int64(1), Int64(5))) { return 4 }
    if (!checkBoundaryLengths(IntNative(-3), IntNative(1), IntNative(5))) { return 5 }
    if (!checkBoundaryLengths(UInt8(0), UInt8(1), UInt8(5))) { return 6 }
    if (!checkBoundaryLengths(UInt16(0), UInt16(1), UInt16(5))) { return 7 }
    if (!checkBoundaryLengths(UInt32(0), UInt32(1), UInt32(5))) { return 8 }
    if (!checkBoundaryLengths(UInt64(0), UInt64(1), UInt64(5))) { return 9 }
    if (!checkBoundaryLengths(UIntNative(0), UIntNative(1), UIntNative(5))) { return 10 }
    if (!checkBoundaryLengths(Float16(-3.0), Float16(1.0), Float16(5.0))) { return 11 }
    if (!checkBoundaryLengths(Float32(-3.0), Float32(1.0), Float32(5.0))) { return 12 }
    if (!checkBoundaryLengths(Float64(-3.0), Float64(1.0), Float64(5.0))) { return 13 }
    if (!checkBoundaryLengths(r'a', r'm', r'z')) { return 14 }
    return 0
}
