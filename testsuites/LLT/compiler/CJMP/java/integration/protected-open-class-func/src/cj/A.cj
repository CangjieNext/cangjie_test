// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import java.internal

public open class A {
    public init() {}
    protected init(i: Int32) {}
    protected func foo(): Unit {
        println("From protected func")
    }
}
