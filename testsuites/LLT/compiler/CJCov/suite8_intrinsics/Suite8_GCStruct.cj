// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-3: 结构体 GC 读写 → CJIntrinsics.cpp getBaseObj/getDest/getSource/getSize
//   覆盖目标:
//     - llvm/lib/IR/CJIntrinsics.cpp:29-30 (getBaseObj cj_gcwrite_struct GCWriteStruct::BaseObj)
//     - llvm/lib/IR/CJIntrinsics.cpp:33-34 (getBaseObj cj_gcread_struct GCReadStruct::BaseObj)
//     - llvm/lib/IR/CJIntrinsics.cpp:47-48 (getValueArg cj_gcwrite_ref GCWriteRef::Val)
//     - llvm/lib/IR/CJIntrinsics.cpp:59-66 (getPointerArg cj_gcwrite_ref / gcread_ref)
//     - llvm/lib/IR/CJIntrinsics.cpp:75-86 (getDest cj_gcwrite_struct / gcread_struct / generic)
//     - llvm/lib/IR/CJIntrinsics.cpp:101-114 (getSource cj_gcwrite_struct / gcread_struct / generic)
//     - llvm/lib/IR/CJIntrinsics.cpp:127-138 (getSize cj_gcwrite_struct / gcread_struct / generic)
//   触发链:
//     - class with GC-managed ref field -> write 触发 cj_gcwrite_ref (ref 字段写)
//     - class with struct field containing nested ref -> cj_gcwrite_struct (struct 拷贝写)
//     - 读取 class 的 struct/ref 字段 -> cj_gcread_ref / cj_gcread_struct
// --dy-std + stdx (String/GC 在 stdx)
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Holder {
    var name: String = "init"
    var info: StructInfo = StructInfo()
}

struct StructInfo {
    var tag: Int64 = 0
    var label: String = "tag0"
}

class Box {
    var inner: Holder = Holder()
}

func writeRefField(h: Holder, s: String): Unit {
    // ref 字段赋值 -> cj_gcwrite_ref
    h.name = s
}

func writeStructField(h: Holder, info: StructInfo): Unit {
    // struct 字段(含 nested ref)赋值 -> cj_gcwrite_struct
    h.info = info
}

func readRefField(h: Holder): String {
    // 读 ref 字段 -> cj_gcread_ref
    return h.name
}

func readStructField(h: Holder): StructInfo {
    // 读 struct 字段 -> cj_gcread_struct
    return h.info
}

main(): Int64 {
    let h = Holder()
    writeRefField(h, "hello")
    var si = StructInfo()
    si.tag = 7
    si.label = "tag7"
    writeStructField(h, si)
    let nm = readRefField(h)
    let info = readStructField(h)
    if (nm != "hello" || info.tag != 7 || info.label != "tag7") { return 1 }

    let b = Box()
    b.inner.name = "deep"
    b.inner.info.tag = 9
    if (b.inner.name != "deep" || b.inner.info.tag != 9) { return 1 }
    return 0
}
