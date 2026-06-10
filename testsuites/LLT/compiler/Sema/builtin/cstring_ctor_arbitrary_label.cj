// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output

// CString 单参 ctor 经通用 ChkCallExpr；历史写法允许任意 named 标签（非 cString 形参名）。
type MyCString = CString

main(): Int64 {
    let _ = CString(am: CPointer<UInt8>())
    let _ = CString(CPointer<UInt8>())
    let _ = MyCString(haha: CPointer<UInt8>())
    let _ = MyCString(CPointer<UInt8>())
    return 0
}
