/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public struct A {
    public func foo(b: B) { println("in cangjie foo, ${b.a}") }
    public mut func mutFoo(b: B): B { println("in cangjie mutFoo, ${b.a}"); b }
    public static func stFoo(b: B): B { println("in cangjie stFoo, ${b.a}"); b }
}

public struct B {
    public var a: Int64 = 1
}
