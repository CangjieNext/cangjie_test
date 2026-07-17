// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件6-2: 浮点循环优化 → 触发 CJLoopFloatOpt.cpp (未覆盖76行)
//   浮点循环累加/乘积累、循环不变量外提、浮点归纳变量
//   触发: Float64 循环 + 累加 + 循环不变量
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func floatSum(n: Int64): Float64 {
    var s = 0.0
    for (i in 0..n) {
        s += Float64(i) * 0.5     // 循环归纳变量 * 不变量
    }
    return s
}

func floatProduct(n: Int64): Float64 {
    var p = 1.0
    for (i in 1..=n) {
        p *= 1.0 + 0.001 * Float64(i)
    }
    return p
}

// 浮点循环 + 循环不变量外提
func floatHoist(n: Int64, k: Float64): Float64 {
    var s = 0.0
    for (i in 0..n) {
        s += k * Float64(i) + k   // k 是循环不变量
    }
    return s
}

// 嵌套浮点循环
func nestedFloat(n: Int64): Float64 {
    var s = 0.0
    for (i in 0..n) {
        var t = 0.0
        for (j in 0..n) {
            t += Float64(j) * 0.25
        }
        s += t
    }
    return s
}

main(): Int64 {
    var s = 0
    s += Int64(floatSum(100))
    s += Int64(floatProduct(50))
    s += Int64(floatHoist(100, 2.0))
    s += Int64(nestedFloat(20))
    if (s > 0) { return 0 }
    return 1
}
