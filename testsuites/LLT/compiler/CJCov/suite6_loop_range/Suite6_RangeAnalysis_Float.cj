// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJSimpleRangeAnalysis.cpp
// 未覆盖行: 102-105, 107, 187-204, 215, 227
// 触发说明: 使用 Float64 常量步进触发 m_FAdd / m_FSub 分支
//           (94-99, 101-107);FCMP_OEQ..FCMP_ONE 走 FP2Int 映射
//           (187-204);浮点比较触发 BBValueCRs TCR(215)。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func floatFAddStep(n: Int64): Float64 {
    // m_FAdd + 浮点常量步进,触发 getRangeFromInitValue 94-99
    var s: Float64 = 0.0
    var i: Int64 = 0
    while (i < n) {
        s = s + 1.0
        i += 1
        if (s < 5.0) {
            // 浮点比较触发 getCRs FP 分支 187-204, 215
            s += 0.5
        }
    }
    return s
}

func floatFSubStep(n: Int64): Float64 {
    // m_FSub 浮点减分支,触发 101-107 (含 Valid=false 路径 107)
    var s: Float64 = 100.0
    var i: Int64 = 0
    while (i < n) {
        s = s - 2.0
        i += 1
        if (s > 50.0) {
            // FCMP_OGT 走 FP2Int 映射
            s -= 1.0
        }
    }
    return s
}

func floatEqLoop(n: Int64): Float64 {
    // FCMP_OEQ / FCMP_ONE 走 FP2Int 映射
    var s: Float64 = 0.0
    for (i in 0..n) {
        s = s + 1.0
        if (s == 5.0) {
            // 触发 227 默认 full set
            s += 100.0
        } else if (s != 3.0) {
            s += 0.1
        }
    }
    return s
}

main(): Int64 {
    var r1 = floatFAddStep(10)
    if (r1 <= 0.0) {
        return 1
    }
    var r2 = floatFSubStep(10)
    if (r2 >= 100.0) {
        return 1
    }
    var r3 = floatEqLoop(10)
    if (r3 <= 0.0) {
        return 1
    }
    return 0
}
