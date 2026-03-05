/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import interoplib.objc.*
import objc.lang.*

public struct C {
    public func foo(a: A) : Unit
    {
        a.foo()
        a.goo(321, 543)
        println(a.koo() * 2)
        println(a.hoo(4396))
    }
}
