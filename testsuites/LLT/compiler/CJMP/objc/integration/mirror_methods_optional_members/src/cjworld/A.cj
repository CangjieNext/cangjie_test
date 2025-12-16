// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import interoplib.objc.*
import objc.lang.*

@ObjCImpl
public open class A <: M {
    public init() {
        super()
    }

    public func aMirrorSuper() {
        println("cj:    A.mirrorSuper()     called")
        super.mirrorMethod()
    }

    public func implALogic() {
        println("cj:    implALogic          called")
    }
}

@ObjCImpl
public class A2 <: A {
    public init() {
        super()
    }

    public func a2MirrorSuper() {
        println("cj:    A2.mirrorSuper()    called")
        super.mirrorMethod()
    }

    public func a2aMirrorSuper() {
        println("cj:    A2.A.mirrorSuper()  called")
        super.aMirrorSuper()
    }

    public func implA2Logic() {
        println("cj:    implA2Logic()       called")
    }

    @ForeignName["runFromCJ"]
    public func runFromCJ(): Unit {
        implA2Logic()
        a2aMirrorSuper()
        a2MirrorSuper()
        mirrorMethod()
        aMirrorSuper()
    }
}

