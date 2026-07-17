// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-4: 泛型拷贝/赋值 → CJGenericIntrinsicOpt.cpp + CJIntrinsics.cpp generic case
//   覆盖目标:
//     - llvm/lib/IR/CJIntrinsics.cpp:36-37 (getBaseObj cj_gcwrite_generic / gcread_generic)
//     - llvm/lib/IR/CJIntrinsics.cpp:84-86 (getDest cj_assign_generic AssignGeneric::DstPtr)
//     - llvm/lib/IR/CJIntrinsics.cpp:109-114 (getSource cj_gcwrite_generic / assign_generic)
//     - llvm/lib/IR/CJIntrinsics.cpp:135-138 (getSize cj_gcwrite_generic / gcread_generic)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:80-101  (lowerToMemcpy switch:
//         cj_assign_generic / cj_gcread_generic / cj_gcwrite_generic)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:111-118 (Size==0 早退 + 调用 lowerToMemcpy)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:126-153 (lowerGenericBarrier:
//         hasInitializer / isReferenceType / hasRefField / isPrimitiveTypeInfo / getTypeLayoutType
//         / containsGCPtrType 各分支)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:159-170 (processGenericBarrier:
//         isStackToStackCopy 路径 + RefValue.findTypeInfoGV 路径)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:173-203 (processAssignGeneric:
//         isStackToStackCopy + isPrimitiveTypeInfo / getTypeLayoutType / fallback)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:205-254 (eliminateReferenceChecking:
//         ti_load metadata + icmp slt 0 替换路径)
//     - llvm/lib/Transforms/Scalar/CJGenericIntrinsicOpt.cpp:271-291 (simplifyGenericInst
//         主循环各 case)
//   触发链:
//     - 泛型 func identity<T>(x: T): T -> 拷贝 T 时产生 cj_assign_generic
//     - T 为 Int64(无 ref 字段) -> lowerToMemcpy fast path
//     - T 为含 ref 字段 class -> 保持 barrier 不 lower
//     - T 为 primitive -> isPrimitiveTypeInfo 路径
//     - 类内字段泛型拷贝 -> cj_gcread_generic / cj_gcwrite_generic
// --dy-std + stdx
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct ValueOnly { var a: Int64 = 0; var b: Int64 = 0 }
class WithRef { var s: String = ""; var n: Int64 = 0 }

class GenericCell<T> {
    var content: T
    public init(content: T) { this.content = content }
    public func get(): T { content }
    public func set(c: T): Unit { content = c }
}

public func identity<T>(x: T): T { x }
public func assignTo<T>(dst: T, src: T): T { src }

func usePrimitive(): Int64 {
    // T = Int64 -> isPrimitiveTypeInfo 分支
    let a = identity<Int64>(42)
    let b = assignTo<Int64>(0, a)
    return b
}

func useValueStruct(): ValueOnly {
    // T = ValueOnly (struct 无 ref 字段) -> lowerGenericBarrier -> getTypeLayoutType +
    //   containsGCPtrType false -> lowerToMemcpy
    var v = ValueOnly()
    v.a = 1
    v.b = 2
    let r = identity<ValueOnly>(v)
    return r
}

func useRefClass(): WithRef {
    // T = WithRef (class, 含 ref 字段) -> hasRefField true -> 不 lower
    let w = WithRef()
    w.s = "abc"; w.n = 5
    let g = GenericCell<WithRef>(w)
    let r = g.get()
    return r
}

func mutateCell(): Int64 {
    // g.set 走 cj_gcwrite_generic 路径
    let g = GenericCell<Int64>(1)
    g.set(99)
    return g.get()
}

main(): Int64 {
    if (usePrimitive() != 42) { return 1 }
    let v = useValueStruct()
    if (v.a != 1 || v.b != 2) { return 1 }
    let w = useRefClass()
    if (w.s != "abc" || w.n != 5) { return 1 }
    if (mutateCell() != 99) { return 1 }
    return 0
}
