// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com::lib.pkgA

public interface I1 {
    public func foo(): Unit { println(1) }
    public func goo(): Unit { println(2) }
}

public func test(ins: I1): Unit {
    ins.goo()
}