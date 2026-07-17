// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件10-1: GC safepoint(statepoint)重写 → 触发 CJRewriteStatepoint.cpp (未覆盖269行)
//   statepoint 在函数调用点(GC 可能暂停扫描)插入重写
//   触发: 持有 GC 对象指针时调用其他函数, 产生 live GC 指针跨调用点
//   覆盖分支: runOnFunction, findBaseDefiningValue(Argument/Constant/LoadInst), rewriteCJThrowException
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Box { var v: Int64 = 0; public init(v: Int64) { this.v = v } }

func helper(a: Int64): Int64 { return a + 1 }

func liveAcrossCall(n: Int64): Int64 {
    let b = Box(n)         // GC 对象
    let r = helper(b.v)    // 持有 b 调用 helper → b 跨调用点 live → statepoint 重写
    b.v = r
    return b.v
}

// 多个 GC 对象跨多次调用
func multiLive(n: Int64): Int64 {
    var a = Box(n)
    var b = Box(n + 1)
    var s = helper(a.v)
    s += helper(b.v)
    a.v = s
    b.v = s + 1
    return a.v + b.v
}

// PHI 来源的 GC 指针(findBaseDefiningValue 的 PHI 分支)
func phiLive(cond: Bool): Int64 {
    let a = Box(1)
    let b = Box(2)
    var r: Box
    if (cond) { r = a } else { r = b }
    // r 经 PHI, 跨调用点 live
    let v = helper(r.v)
    r.v = v
    return r.v
}

// 嵌套调用 + 递归(SCC 内调用, 触发更多 statepoint 路径)
func recur(n: Int64): Int64 {
    if (n <= 0) { return 0 }
    let b = Box(n)
    return b.v + helper(recur(n - 1))
}

main(): Int64 {
    var s = 0
    for (i in 0..100) {
        s += liveAcrossCall(i)
        s += multiLive(i)
        s += phiLive(i % 2 == 0)
        s += recur(i % 10)
    }
    if (s > 0) { return 0 }
    return 1
}
