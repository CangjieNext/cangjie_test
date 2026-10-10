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

const MAX_RANK: Int64 = 4096

func makeData<T>(size: Int64, distribution: Int64, valueAtRank: (Int64) -> T): Array<T> {
    let denominator = if (size > 1) {
        size - 1
    } else {
        1
    }
    let data = Array<T>(size, {
        i => match (distribution) {
            case 0 => valueAtRank((i * MAX_RANK) / denominator)
            case 1 => valueAtRank(((size - i - 1) * MAX_RANK) / denominator)
            case 2 => valueAtRank(MAX_RANK / 2)
            case 3 => valueAtRank((i % 5) * (MAX_RANK / 4))
            case 4 => valueAtRank((i * 37 + i * i * 13 + 17) % (MAX_RANK + 1))
            case _ => valueAtRank((i * MAX_RANK) / denominator)
        }
    })
    if (distribution == 5 && size > 3) {
        let middle = size / 2
        let saved = data[middle - 1]
        data[middle - 1] = data[middle + 1]
        data[middle + 1] = saved
    }
    return data
}

func isSorted<T>(data: Array<T>): Bool where T <: Comparable<T> {
    for (i in 1..data.size) {
        if (data[i - 1].compare(data[i]) == Ordering.GT) {
            return false
        }
    }
    return true
}

func checkDistributions<T>(valueAtRank: (Int64) -> T): Bool where T <: Comparable<T> {
    let lengths: Array<Int64> = [0, 1, 2, 15, 16, 17, 63, 64, 65, 4096]
    for (size in lengths) {
        for (distribution in 0..6) {
            let unstableData = makeData<T>(size, distribution, valueAtRank)
            let stableData = makeData<T>(size, distribution, valueAtRank)
            unstableSort(unstableData)
            stableSort(stableData)
            if (!isSorted(unstableData) || !isSorted(stableData) || unstableData != stableData) {
                return false
            }
        }
    }
    return true
}

main(): Int64 {
    if (!checkDistributions<Int8>({rank => Int8((rank * 255) / MAX_RANK - 128)})) {
        return 1
    }
    if (!checkDistributions<Int16>({rank => Int16((rank * 65_535) / MAX_RANK - 32_768)})) {
        return 2
    }
    if (!checkDistributions<Int32>({rank => Int32(rank - 2048)})) {
        return 3
    }
    if (!checkDistributions<Int64>({rank => rank - 2048})) {
        return 4
    }
    if (!checkDistributions<IntNative>({rank => IntNative(rank - 2048)})) {
        return 5
    }
    if (!checkDistributions<UInt8>({rank => UInt8((rank * 255) / MAX_RANK)})) {
        return 6
    }
    if (!checkDistributions<UInt16>({rank => UInt16((rank * 65_535) / MAX_RANK)})) {
        return 7
    }
    if (!checkDistributions<UInt32>({rank => UInt32(rank)})) {
        return 8
    }
    if (!checkDistributions<UInt64>({rank => UInt64(rank)})) {
        return 9
    }
    if (!checkDistributions<UIntNative>({rank => UIntNative(rank)})) {
        return 10
    }
    if (!checkDistributions<Float16>({rank => Float16(rank - 2048)})) {
        return 11
    }
    if (!checkDistributions<Float32>({rank => Float32(rank - 2048)})) {
        return 12
    }
    if (!checkDistributions<Float64>({rank => Float64(rank - 2048)})) {
        return 13
    }
    if (!checkDistributions<Rune>({rank => Rune(UInt32(32 + (rank * 95) / MAX_RANK))})) {
        return 14
    }
    return 0
}
