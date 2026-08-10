// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

open public class C0 {
    public open func foo() {}
    public open func bar() {}
}

interface I1 {
    func goo(): Int64 { 0 }
}

open public class C1 <: I1 {
    public open func foo() {}
}