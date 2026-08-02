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

func makeData(size: Int64, distribution: Int64): Array<Int32> {
    let data = Array<Int32>(size, repeat: 0)
    for (i in 0..size) {
        match (distribution) {
            case 0 => data[i] = Int32(i)
            case 1 => data[i] = Int32(size - i)
            case 2 => data[i] = 7
            case 3 => data[i] = Int32(i % 5)
            case 4 => data[i] = Int32((i * 37 + i * i * 13 + 17) % 997)
            case _ => data[i] = Int32(i)
        }
    }
    if (distribution == 5 && size > 3) {
        let middle = size / 2
        let saved = data[middle - 1]
        data[middle - 1] = data[middle + 1]
        data[middle + 1] = saved
    }
    return data
}

func isSorted(data: Array<Int32>): Bool {
    for (i in 1..data.size) {
        if (data[i - 1] > data[i]) {
            return false
        }
    }
    return true
}

main(): Int64 {
    let lengths: Array<Int64> = [0, 1, 2, 15, 16, 17, 63, 64, 65, 4096]
    for (size in lengths) {
        for (distribution in 0..6) {
            let unstableData = makeData(size, distribution)
            let stableData = makeData(size, distribution)
            unstableSort(unstableData)
            stableSort(stableData)
            if (!isSorted(unstableData) || !isSorted(stableData) || unstableData != stableData) {
                return 1000 + size * 10 + distribution
            }
        }
    }
    return 0
}
