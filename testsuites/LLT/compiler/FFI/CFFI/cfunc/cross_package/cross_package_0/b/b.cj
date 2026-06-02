// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package b

internal import a.*

public class B <: A {
    public override func f(cb: CFunc<() -> Unit>): Unit {
        println("I am B f()")
    }

    public override func f1(cb: () -> Unit): Unit {
        println("I am B f1()")
    }
}
