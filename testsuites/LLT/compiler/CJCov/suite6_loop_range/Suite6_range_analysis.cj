// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件6-1: 循环变量范围分析 → 触发 CJSimpleRangeAnalysis.cpp (未覆盖32行)
//   getRangeFromInitValue: 循环变量初值取范围
//   getConditionResult / updateBBValueCRs: 循环条件 + 内嵌 if 比较 → 条件结果推断(TRUE/FALSE/UNKNOWN)
//   触发: for 循环 + 常量步进 + 内层 if (i < K) 的嵌套比较
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func rangeLoop(n: Int64): Int64 {
    var s = 0
    for (i in 0..n) {
        // 内嵌比较: i < n/2 → 范围分析可推断 TRUE/FALSE
        if (i < n / 2) {
            s += i
        } else {
            s -= 1
        }
    }
    return s
}

func whileRange(n: Int64): Int64 {
    var i = 0
    var s = 0
    while (i < n) {
        if (i >= n - 5) {
            s += 100
        }
        s += i
        i += 1
    }
    return s
}

// 嵌套循环 + 跨循环条件(触发 getSameParentLoop / isLoopLatch)
func nestedLoop(n: Int64): Int64 {
    var s = 0
    for (i in 0..n) {
        for (j in 0..n) {
            if (i < j) {
                s += 1
            }
        }
    }
    return s
}

// 步进为常量2(触发非1步进的 range 推断)
func stepTwo(n: Int64): Int64 {
    var i = 0
    var s = 0
    while (i < n) {
        s += i
        i += 2
    }
    return s
}

main(): Int64 {
    var s = 0
    s += rangeLoop(100)
    s += whileRange(50)
    s += nestedLoop(20)
    s += stepTwo(100)
    if (s > 0) { return 0 }
    return 1
}
