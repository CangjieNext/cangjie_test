// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test3

import test1.*
import test2.*

public interface I {
    func foo() {
        println("I::foo")
    }
}

extend A <: I {
    
}

public func printB(): B {
    var b = B()
    b.foo()
    return b
}