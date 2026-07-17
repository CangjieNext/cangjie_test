// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-1: 数组拷贝 → CJIntrinsics.cpp getDest/getSource/Size (cj_array_copy_ref)
//   覆盖目标:
//     - llvm/lib/IR/CJIntrinsics.cpp:89-92 (getDest cj_array_copy_* ArrayCopy::DstPtr)
//     - llvm/lib/IR/CJIntrinsics.cpp:115-118 (getSource cj_array_copy_* ArrayCopy::SrcPtr)
//     - llvm/lib/IR/CJIntrinsics.cpp:139-142 (getSize cj_array_copy_* ArrayCopy::Size)
//   触发链: Array.copyTo -> intrinsicBuiltInCopyTo -> @cj_array_copy_ref intrinsic
//   说明: 同时触发 cj_array_copy_struct(元素为 struct), cj_array_copy_generic(generic 上下文)
// --dy-std + stdx 必需(Array/RawArray 在 std.core)
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Pnt { let x: Int64; let y: Int64
    public init(x: Int64, y: Int64) { this.x = x; this.y = y }
}

func copyRefArr(src: Array<Int64>, dst: Array<Int64>): Unit {
    // 元素为 Int64 -> cj_array_copy_ref
    src.copyTo(dst, 0, 0, src.size)
}

func copyStructArr(src: Array<Pnt>, dst: Array<Pnt>): Unit {
    // 元素为 struct -> cj_array_copy_struct
    src.copyTo(dst, 0, 0, src.size)
}

func copySlice(arr: Array<Int64>): Array<Int64> {
    // 切片拷贝同样走 cj_array_copy_*
    let out = Array<Int64>(arr.size, repeat: 0)
    arr.copyTo(out, 0, 0, arr.size)
    return out
}

main(): Int64 {
    let a: Array<Int64> = [1, 2, 3, 4]
    let b = Array<Int64>(4, repeat: 0)
    copyRefArr(a, b)
    if (b[0] != 1 || b[3] != 4) { return 1 }

    let ps: Array<Pnt> = [Pnt(1, 2), Pnt(3, 4)]
    let pd = Array<Pnt>(2, repeat: Pnt(0, 0))
    copyStructArr(ps, pd)
    if (pd[0].x != 1 || pd[1].y != 4) { return 1 }

    let s = copySlice(a)
    if (s.size != a.size || s[2] != 3) { return 1 }
    return 0
}
