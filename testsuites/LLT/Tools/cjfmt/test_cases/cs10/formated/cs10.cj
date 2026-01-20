// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

platform public interface I1 {}

platform sealed interface I2 {}

platform interface A {
    platform public func foo1(a: Int64): Unit
}

platform public open abstract class C2 <: A {}
