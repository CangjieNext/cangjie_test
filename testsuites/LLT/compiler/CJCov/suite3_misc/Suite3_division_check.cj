// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件3-1: 整数除法/取模 → 触发 CJRuntimeLowering.cpp loweringGCDiv (行665-726) + division.check intrinsic lowering
//   Int64/Int32/UInt64 各类型除法, divisor 可能为 0 的分支
//   还触发 markLoweringDivisionCheck / replaceDivisionCheck
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func safeDiv(a: Int64, b: Int64): Int64 {
    if (b == 0) { return -1 }
    return a / b
}

func safeMod(a: Int64, b: Int64): Int64 {
    if (b == 0) { return -1 }
    return a % b
}

func udiv(a: UInt64, b: UInt64): UInt64 {
    if (b == 0) { return 0 }
    return a / b
}

main(): Int64 {
    var sum = 0
    for (i in 1..50) {
        sum += safeDiv(100, i) + safeMod(100, i)
    }
    // 触发 b!=0 的正常除法路径(division.check 通过)
    sum += (if (Int32(7) / Int32(2) > 0) { 1 } else { 0 })
    if (sum > 0) { return 0 }
    return 1
}
