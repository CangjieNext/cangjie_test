/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass <: MyInterface<A> {
    public var x: A = A()
    func f() {
        x = B()
        return x
    }
    public func foo1(): A {
        f()
    }
    public func foo3(): A {
        x
    }
}
