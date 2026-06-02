package p1 

public interface I1<T> {
    func bar(): Int32 {1}
}
extend<T> CPointer<T> <: I1<Int32> {
    public func foo(): Int32 {1}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
