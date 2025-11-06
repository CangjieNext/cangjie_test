/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

@ObjCImpl
public class A <: M {
    public init() {}
    public open func foo() {
        var m = M()
        println("in cangjie foo, ${m.s.x + m.s.y}")
        var s = S()
        s.x = 1
        s.y = 1
        m.s = s
        println("in cangjie foo, ${m.s.x + m.s.y}")
    }
}
