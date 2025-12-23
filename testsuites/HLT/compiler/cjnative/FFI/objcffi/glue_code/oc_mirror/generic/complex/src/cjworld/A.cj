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
    public init() {
    }
    public open func foo(): Unit {
        println("in cangjie foo")
        let m = M()
        let result = global_func(m)
        m.pFoo()
    }
    public func testGenerics(): Unit {
        println("cj testGenerics")
        // NSLog(NSString())
        // let dog = Dog()
        let m = M()

        let b = Box(m)
        let mm = b.getContent()
        m.mFoo()
    }
}
