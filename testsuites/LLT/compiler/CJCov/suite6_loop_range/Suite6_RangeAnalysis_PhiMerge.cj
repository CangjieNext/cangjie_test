// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJSimpleRangeAnalysis.cpp
// 未覆盖行: 59 (Visited 已存在), 81-82 (phi 同基址合并), 457 (EnableCJSimpleRA 关闭路径)
//           489-492, 494-498, 500-503, 509-510 (legacy PM 注册/构造)
// 触发说明: 多个分支汇聚成 phi,所有 incoming 值都源于同一基址不同差值
//           (a+1, a+1),触发 81-82 OriginBV 返回路径;simplifyBinaryInst 中的
//           连续 fadd/add 链触发 415-417 的 Visited.insert().second=false (59)。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func phiSameBase(a: Int64, b: Int64): Int64 {
    // 两个分支都生成 a+1,phi 合并后基址一致,触发 81-82
    var r: Int64 = 0
    if (a > b) {
        r = a + 1
    } else {
        r = a + 1
    }
    if (r < 100) {
        return r
    }
    return 100
}

func chainedAdd(n: Int64): Int64 {
    // 连续 add 链:simplifyBinaryInst 递归调用 getRangeFromInitValue
    // 多次访问同一指令,触发 59 Visited 已存在
    var x: Int64 = 0
    x = x + 1
    x = x + 1
    x = x + 1
    for (i in 0..n) {
        x += i
    }
    return x
}

func selfLoopPattern(n: Int64): Int64 {
    // 形如 %n = add i64 %n, 1 的自循环,simplifyBinaryInst 中 Visited 命中 59
    var i: Int64 = 0
    var acc: Int64 = 0
    while (i < n) {
        i = i + 1
        acc = acc + i
    }
    return acc
}

func phiThreeWay(a: Int64, b: Int64, c: Int64): Int64 {
    // 三路汇聚的 phi:通过 match 走 74-79 检查 OriginBV 一致性
    var r: Int64 = 0
    if (a > 0) {
        r = b + 2
    } else if (a > -10) {
        r = b + 2
    } else {
        r = b + 2
    }
    if (r < 1000) {
        return r
    }
    return 1000
}

main(): Int64 {
    var r1 = phiSameBase(5, 3)
    if (r1 != 6) {
        return 1
    }
    var r2 = chainedAdd(10)
    if (r2 <= 0) {
        return 1
    }
    var r3 = selfLoopPattern(20)
    if (r3 <= 0) {
        return 1
    }
    var r4 = phiThreeWay(1, 10, 100)
    if (r4 != 12) {
        return 1
    }
    return 0
}
