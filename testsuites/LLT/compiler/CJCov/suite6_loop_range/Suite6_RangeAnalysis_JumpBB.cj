// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJSimpleRangeAnalysis.cpp
// 未覆盖行: 288-291 (createJumpBB phi 重映射), 324 (getConditionResult full set), 346 (updateBBValueCRs full set)
// 触发说明: 在循环中放置可被简化为常真/常假的嵌套 if,使 processBasicBlock
//           创建跳转块并克隆 phi(285-293);在不同基址的连续条件中触发
//           isFullSet 提前返回(324, 346)。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func jumpBBTrigger(n: Int64): Int64 {
    // 单一前驱 + 嵌套条件分支: i < n 是外层条件,内部又对 i 比较
    // 触发 createJumpBB 的 phi 克隆路径 285-293
    var sum: Int64 = 0
    for (i in 0..n) {
        if (i < 10) {
            // 此分支对同基址 i 再比较,触发 getConditionResult TRUE 路径
            if (i < 5) {
                sum += 1
            } else {
                sum += 2
            }
        } else {
            sum += 3
        }
    }
    return sum
}

func fullSetIntersect(n: Int64): Int64 {
    // 两个不同基址的连续比较触发 324 与 346 的 isFullSet 检查
    var a: Int64 = 0
    var b: Int64 = 10
    for (i in 0..n) {
        a += 1
        b -= 1
        // 不同基址 a vs b,Prev.BV != Curr.BV -> 319 UNKNOWN -> 324 fullSet
        if (a < 5) {
            if (b < 5) {
                return 1
            }
        }
    }
    return a + b
}

func nestedCondChain(n: Int64): Int64 {
    // 连续两层同基址条件触发 updateBBValueCRs 的 346 检查
    var x: Int64 = 0
    for (i in 0..n) {
        x = x + 1
        if (x < 100) {
            // 此条件基于 x 的更新,触发 updateBBValueCRs 走 347-348
            if (x < 50) {
                return x
            }
        }
    }
    return x
}

main(): Int64 {
    var r1 = jumpBBTrigger(15)
    if (r1 <= 0) {
        return 1
    }
    var r2 = fullSetIntersect(20)
    if (r2 < 0) {
        return 1
    }
    var r3 = nestedCondChain(200)
    if (r3 <= 0) {
        return 1
    }
    return 0
}
