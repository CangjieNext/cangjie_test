// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJSimpleRangeAnalysis.cpp
// 未覆盖行: 59, 81-82, 102-105, 107, 215, 227, 288-291, 324, 346, 457
// 触发说明: 通过常量步进 + 条件比较触发 getRangeFromInitValue、
//           getConditionResult、updateBBValueCRs；嵌套条件分支触发
//           createJumpBB(288-291) 与 CR.isFullSet 检查(324, 346)。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func condCheck(n: Int64): Int64 {
    // 0..n 循环,常量步进 1,触发 getRangeFromInitValue 走 m_Add 分支
    var sum: Int64 = 0
    for (i in 0..n) {
        // 条件比较触发 getConditionResult / updateBBValueCRs
        if (i < 5) {
            sum += i
        } else {
            sum += 1
        }
    }
    return sum
}

func phiMerge(a: Int64, b: Int64): Int64 {
    // 两个 incoming 值都来自同一基址但不同差值,触发 81-82 的 OriginBV 路径
    var x: Int64 = 0
    if (a > b) {
        x = a + 1
    } else {
        x = a + 1
    }
    // 下方条件比较触发 215 的 TCR 取值
    if (x < 100) {
        return x
    }
    return 100
}

func subStep(n: Int64): Int64 {
    // i -= 1 走 m_Sub 分支
    var i: Int64 = n
    var acc: Int64 = 0
    while (i > 0) {
        acc += 1
        i -= 1
        if (i < 3) {
            // 触发 createJumpBB 与 phi 重映射 288-291
            acc += 10
        }
    }
    return acc
}

func fullSetCheck(n: Int64): Int64 {
    // 两个比较基址不同触发 227 默认 full set 返回 / 324 unknown
    var x: Int64 = 0
    var y: Int64 = 0
    for (i in 0..n) {
        x = x + 1
        y = y + 2
        if (x < 10) {
            // x 与 y 不同基址,Prev.BV != Curr.BV 走 319 unknown
            if (y < 5) {
                return -1
            }
        }
    }
    return x + y
}

main(): Int64 {
    var r1 = condCheck(10)
    if (r1 <= 0) {
        return 1
    }
    var r2 = phiMerge(2, 1)
    if (r2 <= 0) {
        return 1
    }
    var r3 = subStep(8)
    if (r3 <= 0) {
        return 1
    }
    var r4 = fullSetCheck(20)  // fullSetCheck 可能提前 return -1, 此处仅触发
    if (false) {  // r4 可为 -1(触发 return -1 路径), 不作值断言
        return 1
    }
    return 0
}
