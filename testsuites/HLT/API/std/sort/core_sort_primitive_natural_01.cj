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
    var i8u: Array<Int8> = [3, -1, 2, 2]
    var i8s: Array<Int8> = [3, -1, 2, 2]
    var i8e: Array<Int8> = [-1, 2, 2, 3]
    if (!checkNaturalSort(i8u, i8s, i8e)) { return 1 }

    var i16u: Array<Int16> = [3, -1, 2, 2]
    var i16s: Array<Int16> = [3, -1, 2, 2]
    var i16e: Array<Int16> = [-1, 2, 2, 3]
    if (!checkNaturalSort(i16u, i16s, i16e)) { return 2 }

    var i32u: Array<Int32> = [3, -1, 2, 2]
    var i32s: Array<Int32> = [3, -1, 2, 2]
    var i32e: Array<Int32> = [-1, 2, 2, 3]
    if (!checkNaturalSort(i32u, i32s, i32e)) { return 3 }

    var i64u: Array<Int64> = [3, -1, 2, 2]
    var i64s: Array<Int64> = [3, -1, 2, 2]
    var i64e: Array<Int64> = [-1, 2, 2, 3]
    if (!checkNaturalSort(i64u, i64s, i64e)) { return 4 }

    var inu: Array<IntNative> = [3, -1, 2, 2]
    var ins: Array<IntNative> = [3, -1, 2, 2]
    var ine: Array<IntNative> = [-1, 2, 2, 3]
    if (!checkNaturalSort(inu, ins, ine)) { return 5 }

    var u8u: Array<UInt8> = [3, 0, 2, 2]
    var u8s: Array<UInt8> = [3, 0, 2, 2]
    var u8e: Array<UInt8> = [0, 2, 2, 3]
    if (!checkNaturalSort(u8u, u8s, u8e)) { return 6 }

    var u16u: Array<UInt16> = [3, 0, 2, 2]
    var u16s: Array<UInt16> = [3, 0, 2, 2]
    var u16e: Array<UInt16> = [0, 2, 2, 3]
    if (!checkNaturalSort(u16u, u16s, u16e)) { return 7 }

    var u32u: Array<UInt32> = [3, 0, 2, 2]
    var u32s: Array<UInt32> = [3, 0, 2, 2]
    var u32e: Array<UInt32> = [0, 2, 2, 3]
    if (!checkNaturalSort(u32u, u32s, u32e)) { return 8 }

    var u64u: Array<UInt64> = [3, 0, 2, 2]
    var u64s: Array<UInt64> = [3, 0, 2, 2]
    var u64e: Array<UInt64> = [0, 2, 2, 3]
    if (!checkNaturalSort(u64u, u64s, u64e)) { return 9 }

    var unu: Array<UIntNative> = [3, 0, 2, 2]
    var uns: Array<UIntNative> = [3, 0, 2, 2]
    var une: Array<UIntNative> = [0, 2, 2, 3]
    if (!checkNaturalSort(unu, uns, une)) { return 10 }

    var f16u: Array<Float16> = [3.0, -1.0, 2.0, 2.0]
    var f16s: Array<Float16> = [3.0, -1.0, 2.0, 2.0]
    var f16e: Array<Float16> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkNaturalSort(f16u, f16s, f16e)) { return 11 }

    var f32u: Array<Float32> = [3.0, -1.0, 2.0, 2.0]
    var f32s: Array<Float32> = [3.0, -1.0, 2.0, 2.0]
    var f32e: Array<Float32> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkNaturalSort(f32u, f32s, f32e)) { return 12 }

    var f64u: Array<Float64> = [3.0, -1.0, 2.0, 2.0]
    var f64s: Array<Float64> = [3.0, -1.0, 2.0, 2.0]
    var f64e: Array<Float64> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkNaturalSort(f64u, f64s, f64e)) { return 13 }

    var ru: Array<Rune> = [r'c', r'a', r'b', r'b']
    var rs: Array<Rune> = [r'c', r'a', r'b', r'b']
    var re: Array<Rune> = [r'a', r'b', r'b', r'c']
    if (!checkNaturalSort(ru, rs, re)) { return 14 }
    return 0
}
