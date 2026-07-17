// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件9-2: 栈上对象标量替换(RSSCE) → 触发 CJRSSCE.cpp (未覆盖199行)
//   RSSCE 在逃逸分析判定"不逃逸"后, 把栈对象字段拆成标量
//   触发分支: isBaseAllocaValue(GEP/Load/Select/PHI), getBaseUses, setInfoEscapeParam 各分支
//   需要: 局部 new 的对象不逃逸, 且字段被 GEP/load/store/memcpy/select/PHI 多种方式访问
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Point {
    var x: Int64 = 0
    var y: Int64 = 0
    public init(x: Int64, y: Int64) { this.x = x; this.y = y }
}

struct Pair {
    var a: Int64 = 0
    var b: Int64 = 0
}

// 不逃逸的 Point, 字段经 GEP/load/store 访问 → RSSCE 标量替换
func scalarize(cond: Bool): Int64 {
    let p = Point(1, 2)
    var s = p.x + p.y          // load 字段
    var q = Point(3, 4)
    // memcpy 风格: 字段间拷贝
    q.x = p.x
    q.y = p.y
    s += q.x * 10 + q.y
    // select 风格: 条件选对象字段
    let r = if (cond) { p } else { q }
    s += r.x + r.y
    return s
}

// PHI 合并栈对象: if-else 给同类型变量赋不同栈对象
func phiMerge(): Int64 {
    var p: Point
    if (true) {
        p = Point(10, 20)
    } else {
        p = Point(30, 40)
    }
    return p.x + p.y
}

// struct Pair 栈对象 + 多字段访问
func usePair(): Int64 {
    var pr = Pair()
    pr.a = 5
    pr.b = 6
    var copy = Pair()
    copy.a = pr.a
    copy.b = pr.b
    return copy.a * 100 + copy.b
}

// 间接调用 / 外部参数场景(setInfoEscapeParam 分支)
func passTo(inner: Bool): Int64 {
    let p = Point(100, 200)
    var v = 0
    if (inner) {
        v = p.x
    } else {
        v = p.y
    }
    return v
}

main(): Int64 {
    var s = 0
    for (i in 0..50) {
        s += scalarize(i % 2 == 0)
    }
    s += phiMerge()
    s += usePair()
    s += passTo(true)
    s += passTo(false)
    if (s > 0) { return 0 }
    return 1
}
