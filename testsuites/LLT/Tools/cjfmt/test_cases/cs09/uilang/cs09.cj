// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

common public interface I1 {}
common sealed interface I2 {}

common interface A {
    public func foo1(a: Int64): Unit
    func foo4(): Int64
}

common public open abstract class C2 <: A {}