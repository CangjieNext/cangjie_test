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

import std.collection.*
import std.sort.*

func checkContainers<T>(input: Array<T>, expected: Array<T>): Bool where T <: Comparable<T> {
    var list: List<T> = ArrayList<T>(input)
    let arrayList = ArrayList<T>(input)
    sort(list, stable: false)
    sort(arrayList, stable: true)
    return list.toArray() == expected && arrayList.toArray() == expected
}

main(): Int64 {
    let i8: Array<Int8> = [3, -1, 2, 2]
    let i8e: Array<Int8> = [-1, 2, 2, 3]
    if (!checkContainers(i8, i8e)) { return 1 }

    let i16: Array<Int16> = [3, -1, 2, 2]
    let i16e: Array<Int16> = [-1, 2, 2, 3]
    if (!checkContainers(i16, i16e)) { return 2 }

    let i32: Array<Int32> = [3, -1, 2, 2]
    let i32e: Array<Int32> = [-1, 2, 2, 3]
    if (!checkContainers(i32, i32e)) { return 3 }

    let i64: Array<Int64> = [3, -1, 2, 2]
    let i64e: Array<Int64> = [-1, 2, 2, 3]
    if (!checkContainers(i64, i64e)) { return 4 }

    let intNative: Array<IntNative> = [3, -1, 2, 2]
    let intNativeExpected: Array<IntNative> = [-1, 2, 2, 3]
    if (!checkContainers(intNative, intNativeExpected)) { return 5 }

    let u8: Array<UInt8> = [3, 0, 2, 2]
    let u8e: Array<UInt8> = [0, 2, 2, 3]
    if (!checkContainers(u8, u8e)) { return 6 }

    let u16: Array<UInt16> = [3, 0, 2, 2]
    let u16e: Array<UInt16> = [0, 2, 2, 3]
    if (!checkContainers(u16, u16e)) { return 7 }

    let u32: Array<UInt32> = [3, 0, 2, 2]
    let u32e: Array<UInt32> = [0, 2, 2, 3]
    if (!checkContainers(u32, u32e)) { return 8 }

    let u64: Array<UInt64> = [3, 0, 2, 2]
    let u64e: Array<UInt64> = [0, 2, 2, 3]
    if (!checkContainers(u64, u64e)) { return 9 }

    let uintNative: Array<UIntNative> = [3, 0, 2, 2]
    let uintNativeExpected: Array<UIntNative> = [0, 2, 2, 3]
    if (!checkContainers(uintNative, uintNativeExpected)) { return 10 }

    let f16: Array<Float16> = [3.0, -1.0, 2.0, 2.0]
    let f16e: Array<Float16> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkContainers(f16, f16e)) { return 11 }

    let f32: Array<Float32> = [3.0, -1.0, 2.0, 2.0]
    let f32e: Array<Float32> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkContainers(f32, f32e)) { return 12 }

    let f64: Array<Float64> = [3.0, -1.0, 2.0, 2.0]
    let f64e: Array<Float64> = [-1.0, 2.0, 2.0, 3.0]
    if (!checkContainers(f64, f64e)) { return 13 }

    let runeData: Array<Rune> = [r'c', r'a', r'b', r'b']
    let runeExpected: Array<Rune> = [r'a', r'b', r'b', r'c']
    if (!checkContainers(runeData, runeExpected)) { return 14 }
    return 0
}
