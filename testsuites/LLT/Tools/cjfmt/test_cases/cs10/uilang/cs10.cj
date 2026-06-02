// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

specific public interface I1 {}
sealed specific interface I2 {}

specific interface A {
    public specific func foo1(a: Int64): Unit
}

public abstract open specific class C2 <: A {}