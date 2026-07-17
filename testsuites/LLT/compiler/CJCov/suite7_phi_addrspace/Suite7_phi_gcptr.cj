// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件7-1: GC 指针经 PHI 合并(多路来源) → 触发 CJGCInstrRestore.cpp isFromAlloc/getBasePointer 的 PHI 分支(行98-218)
//   shouldRestore: 对非 alloca 来源的 GC 指针 load/store 插 cj_gcwrite_ref
//   isFromAlloc: PHI 递归判断是否全栈分配
//   getBasePointer: PHI 节点建 base 指针
//   触发: if-else 给同一引用变量赋不同来源(均非 alloca), 产生 PHI
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Box { var x: Int64 = 0 }

func pick(cond: Bool, a: Box, b: Box): Box {
    // cond 路径选 a 或 b → IR 层 PHI(a, b), 两个都来自参数(非 alloca)
    var r: Box
    if (cond) {
        r = a
    } else {
        r = b
    }
    r.x = r.x + 1
    return r
}

main(): Int64 {
    let a = Box()
    let b = Box()
    a.x = 10
    b.x = 20
    var sum = 0
    for (i in 0..100) {
        let c = (i % 2 == 0)
        let r = pick(c, a, b)
        sum += r.x
    }
    if (sum > 0) { return 0 }
    return 1
}
