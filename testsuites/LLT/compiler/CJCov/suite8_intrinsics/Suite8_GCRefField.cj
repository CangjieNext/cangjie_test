// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-5: GC ref 读写 static + 非 static → CJIntrinsics.cpp getPointerArg/getValueArg 全分支
//   覆盖目标:
//     - llvm/lib/IR/CJIntrinsics.cpp:47-48 (getValueArg cj_gcwrite_ref GCWriteRef::Val)
//     - llvm/lib/IR/CJIntrinsics.cpp:49-50 (getValueArg cj_gcwrite_static_ref GCWriteStaticRef::Val)
//     - llvm/lib/IR/CJIntrinsics.cpp:59-62 (getPointerArg cj_gcwrite_ref FieldPtr)
//     - llvm/lib/IR/CJIntrinsics.cpp:61-62 (getPointerArg cj_gcwrite_static_ref Ptr)
//     - llvm/lib/IR/CJIntrinsics.cpp:63-64 (getPointerArg cj_gcread_ref FieldPtr)
//     - llvm/lib/IR/CJIntrinsics.cpp:65-66 (getPointerArg cj_gcread_static_ref Ptr)
//   触发链:
//     - 实例字段写/读 -> cj_gcwrite_ref / cj_gcread_ref
//     - 静态字段写/读 -> cj_gcwrite_static_ref / cj_gcread_static_ref
// --dy-std + stdx (String / static 字段涉及 stdx)
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Counter {
    static var globalTag: String = "default"
    var localTag: String = "instance"
    static var globalN: Int64 = 0
    var localN: Int64 = 0
}

func bumpStatic(v: String): Unit {
    // 静态 ref 字段赋值 -> cj_gcwrite_static_ref
    Counter.globalTag = v
    Counter.globalN = Counter.globalN + 1
}

func bumpInstance(c: Counter, v: String): Unit {
    // 实例 ref 字段赋值 -> cj_gcwrite_ref
    c.localTag = v
    c.localN = c.localN + 1
}

func readStatic(): String {
    // 静态 ref 字段读 -> cj_gcread_static_ref
    return Counter.globalTag
}

func readInstance(c: Counter): String {
    // 实例 ref 字段读 -> cj_gcread_ref
    return c.localTag
}

main(): Int64 {
    let c = Counter()
    bumpStatic("v1")
    bumpInstance(c, "v2")
    let s1 = readStatic()
    let s2 = readInstance(c)
    if (s1 != "v1" || s2 != "v2") { return 1 }
    if (Counter.globalN != 1 || c.localN != 1) { return 1 }
    return 0
}
