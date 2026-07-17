// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件7-2: 对象复用 + 多路赋值 → 触发 CJObjectReuseOpt.cpp (未覆盖28行) + CJGCInstrRestore 地址空间 cast 分支
//   CJObjectReuseOpt: 循环里重复 new 的对象可复用前一次的内存
//   构造: 循环内 new 多个同类型对象 + 条件分支产生不同来源的 GC 指针
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Data {
    var a: Int64 = 0
    var b: Int64 = 0
    public init(a: Int64, b: Int64) { this.a = a; this.b = b }
}

func compute(tag: Int64): Int64 {
    var d: Data
    if (tag > 0) {
        d = Data(tag, tag * 2)
    } else {
        d = Data(-tag, -tag * 3)
    }
    return d.a + d.b
}

main(): Int64 {
    var s = 0
    for (i in 1..200) {
        s += compute(i)
    }
    if (s > 0) { return 0 }
    return 1
}
