// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-1: 数组拷贝/struct GC 读写 intrinsic → 触发 CJIntrinsics.cpp(参数读取) + CJGenericIntrinsicOpt
//   cj_array_copy_ref/struct/generic: 数组整体拷贝
//   cj_gcwrite_struct / cj_gcread_struct: struct 含 GC 引用字段的读写
//   触发: Array 拷贝 + 含 GC 字段 struct 的字段访问
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff unused %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.collection.*

class Ref { var v: Int64 = 0; public init(v: Int64) { this.v = v } }
struct Cell { var r: Ref = Ref(0); var n: Int64 = 0 }

func arrayCopy(n: Int64): Int64 {
    let a: Array<Int64> = Array<Int64>(n, repeat: 0)
    for (i in 0..n) { a[i] = i }
    let b: Array<Int64> = Array<Int64>(n, repeat: 0)
    // 整体拷贝 → cj_array_copy
    for (i in 0..n) { b[i] = a[i] }
    var s = 0
    for (i in 0..n) { s += b[i] }
    return s
}

// ArrayList 拷贝(触发 cj_array_copy_generic)
func listCopy(n: Int64): Int64 {
    var src = ArrayList<Int64>([])
    for (i in 0..n) { src.add(i) }
    var dst = ArrayList<Int64>([])
    for (v in src) { dst.add(v) }
    var s = 0
    for (v in dst) { s += v }
    return s
}

// struct 含 GC 引用字段读写(cj_gcwrite_struct / cj_gcread_struct)
func cellOps(n: Int64): Int64 {
    var c = Cell()
    let r = Ref(n)
    c.r = r              // cj_gcwrite_struct
    c.n = n
    let got = c.r        // cj_gcread_struct
    return got.v + c.n
}

main(): Int64 {
    var s = 0
    s += arrayCopy(100)
    s += listCopy(100)
    for (i in 0..50) { s += cellOps(i) }
    if (s > 0) { return 0 }
    return 1
}
