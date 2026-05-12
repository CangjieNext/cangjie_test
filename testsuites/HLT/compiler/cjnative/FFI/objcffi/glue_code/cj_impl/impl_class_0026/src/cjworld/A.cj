/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public class NonOpen {
    public var v: Int64
    public init(p0: Int64) {v = p0}
    public func getV() { v }
}

private var A_stNO: NonOpen = NonOpen(42)
public enum A {
    | E
    | ENO(NonOpen)

    public prop pNO: NonOpen {
        get(){
            match(this) {
                case ENO(n) => n
                case _ => A_stNO
            }
        }
    }
    public static prop stpNO: NonOpen {get(){A_stNO}}

    public func f(p0: NonOpen): NonOpen {
        println("in cj enum f ${p0.v}")
        p0.v += 1
        p0
    }
    public func implicitF(p0: NonOpen) {
        println("in cj enum implicitF ${p0.v}")
        p0.v += 1
        p0
    }
    public static func stF(p0: NonOpen): NonOpen {
        println("in cj enum stF ${p0.v}")
        p0.v += 1
        p0
    }

    // aux method to set A_stNO with NonOpen instance created from ObjC side
    public func setStNO() { A_stNO = pNO }
}