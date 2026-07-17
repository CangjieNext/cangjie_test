// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件2-1: GC 写屏障 → 触发 CJBarrierLowering.cpp fastBarrier(cj_gcwrite_ref/cj_gcwrite_struct) + CJBarrierOpt + CJBarrierSplit
//   cj_gcwrite: 给对象字段赋引用值(尤其跨对象引用) → 写屏障插入
//   null base 分支: BaseObj 为 null 时替换为 store
//   触发: 对象 A 的字段指向对象 B(引用赋值产生 gcwrite)
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff unused %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Inner { var x: Int64 = 0 }
class Outer {
    var ref: Inner
    var n: Int64 = 0
    public init() { ref = Inner() }
}

func writeBarrier(n: Int64): Int64 {
    let o = Outer()
    let i1 = Inner()
    i1.x = n
    o.ref = i1           // 引用赋值 → cj_gcwrite_ref
    let i2 = Inner()
    i2.x = n * 2
    o.ref = i2           // 再次写屏障(覆盖)
    return o.ref.x
}

// 含 GC 引用字段的 struct 写屏障(cj_gcwrite_struct)
struct Holder {
    var inner: Inner
    public init() { inner = Inner() }
}

func structWrite(n: Int64): Int64 {
    var h = Holder()
    let i = Inner()
    i.x = n
    h.inner = i
    return h.inner.x
}

// 多次循环写屏障 → 触发屏障合并/分裂优化
func loopWrite(n: Int64): Int64 {
    var s = 0
    var prev: Outer = Outer()
    for (i in 0..n) {
        let o = Outer()
        o.ref.x = i
        prev.ref = o.ref      // 循环内写屏障
        s += prev.ref.x
    }
    return s
}

main(): Int64 {
    var s = 0
    for (i in 0..50) {
        s += writeBarrier(i)
        s += structWrite(i)
        s += loopWrite(10)
    }
    if (s > 0) { return 0 }
    return 1
}
