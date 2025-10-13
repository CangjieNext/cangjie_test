package p1

public interface I1 {
    func foo(a: Int32): Int64
}
public interface I2 {
    func foo(a: Int64): Int64
}
extend CString <: I1 {
    public func foo(a: Int32): Int64 { Int64(a)-1 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
