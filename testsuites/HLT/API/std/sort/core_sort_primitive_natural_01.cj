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

func checkNaturalSort<T>(unstableData: Array<T>, stableData: Array<T>, expected: Array<T>): Bool
    where T <: Comparable<T> {
    unstableSort(unstableData)
    stableSort(stableData)
    return unstableData == expected && stableData == expected
}

main(): Int64 {
    var i8u: Array<Int8> = [Int8.Max, Int8.Min, 0, -1, 1, Int8.Max]
    var i8s: Array<Int8> = [Int8.Max, Int8.Min, 0, -1, 1, Int8.Max]
    var i8e: Array<Int8> = [Int8.Min, -1, 0, 1, Int8.Max, Int8.Max]
    if (!checkNaturalSort(i8u, i8s, i8e)) {
        return 1
    }

    var i16u: Array<Int16> = [Int16.Max, Int16.Min, 0, -1, 1, Int16.Max]
    var i16s: Array<Int16> = [Int16.Max, Int16.Min, 0, -1, 1, Int16.Max]
    var i16e: Array<Int16> = [Int16.Min, -1, 0, 1, Int16.Max, Int16.Max]
    if (!checkNaturalSort(i16u, i16s, i16e)) {
        return 2
    }

    var i32u: Array<Int32> = [Int32.Max, Int32.Min, 0, -1, 1, Int32.Max]
    var i32s: Array<Int32> = [Int32.Max, Int32.Min, 0, -1, 1, Int32.Max]
    var i32e: Array<Int32> = [Int32.Min, -1, 0, 1, Int32.Max, Int32.Max]
    if (!checkNaturalSort(i32u, i32s, i32e)) {
        return 3
    }

    var i64u: Array<Int64> = [Int64.Max, Int64.Min, 0, -1, 1, Int64.Max]
    var i64s: Array<Int64> = [Int64.Max, Int64.Min, 0, -1, 1, Int64.Max]
    var i64e: Array<Int64> = [Int64.Min, -1, 0, 1, Int64.Max, Int64.Max]
    if (!checkNaturalSort(i64u, i64s, i64e)) {
        return 4
    }

    var inu: Array<IntNative> = [IntNative.Max, IntNative.Min, 0, -1, 1, IntNative.Max]
    var ins: Array<IntNative> = [IntNative.Max, IntNative.Min, 0, -1, 1, IntNative.Max]
    var ine: Array<IntNative> = [IntNative.Min, -1, 0, 1, IntNative.Max, IntNative.Max]
    if (!checkNaturalSort(inu, ins, ine)) {
        return 5
    }

    var u8u: Array<UInt8> = [UInt8.Max, UInt8.Min, 2, 1, UInt8.Max]
    var u8s: Array<UInt8> = [UInt8.Max, UInt8.Min, 2, 1, UInt8.Max]
    var u8e: Array<UInt8> = [UInt8.Min, 1, 2, UInt8.Max, UInt8.Max]
    if (!checkNaturalSort(u8u, u8s, u8e)) {
        return 6
    }

    var u16u: Array<UInt16> = [UInt16.Max, UInt16.Min, 2, 1, UInt16.Max]
    var u16s: Array<UInt16> = [UInt16.Max, UInt16.Min, 2, 1, UInt16.Max]
    var u16e: Array<UInt16> = [UInt16.Min, 1, 2, UInt16.Max, UInt16.Max]
    if (!checkNaturalSort(u16u, u16s, u16e)) {
        return 7
    }

    var u32u: Array<UInt32> = [UInt32.Max, UInt32.Min, 2, 1, UInt32.Max]
    var u32s: Array<UInt32> = [UInt32.Max, UInt32.Min, 2, 1, UInt32.Max]
    var u32e: Array<UInt32> = [UInt32.Min, 1, 2, UInt32.Max, UInt32.Max]
    if (!checkNaturalSort(u32u, u32s, u32e)) {
        return 8
    }

    var u64u: Array<UInt64> = [UInt64.Max, UInt64.Min, 2, 1, UInt64.Max]
    var u64s: Array<UInt64> = [UInt64.Max, UInt64.Min, 2, 1, UInt64.Max]
    var u64e: Array<UInt64> = [UInt64.Min, 1, 2, UInt64.Max, UInt64.Max]
    if (!checkNaturalSort(u64u, u64s, u64e)) {
        return 9
    }

    var unu: Array<UIntNative> = [UIntNative.Max, UIntNative.Min, 2, 1, UIntNative.Max]
    var uns: Array<UIntNative> = [UIntNative.Max, UIntNative.Min, 2, 1, UIntNative.Max]
    var une: Array<UIntNative> = [UIntNative.Min, 1, 2, UIntNative.Max, UIntNative.Max]
    if (!checkNaturalSort(unu, uns, une)) {
        return 10
    }

    var f16u: Array<Float16> = [Float16.Max, -Float16.Max, -0.0, 0.0, -1.0, 1.0]
    var f16s: Array<Float16> = [Float16.Max, -Float16.Max, -0.0, 0.0, -1.0, 1.0]
    var f16e: Array<Float16> = [-Float16.Max, -1.0, -0.0, 0.0, 1.0, Float16.Max]
    if (!checkNaturalSort(f16u, f16s, f16e)) {
        return 11
    }

    var f32u: Array<Float32> = [Float32.Max, -Float32.Max, -0.0, 0.0, -1.0, 1.0]
    var f32s: Array<Float32> = [Float32.Max, -Float32.Max, -0.0, 0.0, -1.0, 1.0]
    var f32e: Array<Float32> = [-Float32.Max, -1.0, -0.0, 0.0, 1.0, Float32.Max]
    if (!checkNaturalSort(f32u, f32s, f32e)) {
        return 12
    }

    var f64u: Array<Float64> = [Float64.Max, -Float64.Max, -0.0, 0.0, -1.0, 1.0]
    var f64s: Array<Float64> = [Float64.Max, -Float64.Max, -0.0, 0.0, -1.0, 1.0]
    var f64e: Array<Float64> = [-Float64.Max, -1.0, -0.0, 0.0, 1.0, Float64.Max]
    if (!checkNaturalSort(f64u, f64s, f64e)) {
        return 13
    }

    var ru: Array<Rune> = [Rune(0x10ffff), r'a', Rune(0), r'\u{4f60}', r'a']
    var rs: Array<Rune> = [Rune(0x10ffff), r'a', Rune(0), r'\u{4f60}', r'a']
    var re: Array<Rune> = [Rune(0), r'a', r'a', r'\u{4f60}', Rune(0x10ffff)]
    if (!checkNaturalSort(ru, rs, re)) {
        return 14
    }
    return 0
}
