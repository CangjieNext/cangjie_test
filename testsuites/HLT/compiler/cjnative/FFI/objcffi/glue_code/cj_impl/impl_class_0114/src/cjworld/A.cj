/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public open class Opencls {
    public var v: Int64
    public init(p0: Int64) {v = p0}
    public func getV() { v }
}

private var A_stOC: Opencls = Opencls(42)

public enum A {
    | E
    | EOC(Opencls)

    public prop pOC: Opencls {
        get(){
            match(this) {
                case EOC(n) => n
                case _ => A_stOC
            }
        }
    }

    public static prop stpOC: Opencls {get(){A_stOC}}

    public func f(p0: Opencls): Opencls {
        println("in cj enum f ${p0.v}")
        p0.v += 1
        p0
    }
    public func implicitF(p0: Opencls) {
        println("in cj enum implicitF ${p0.v}")
        p0.v += 1
        p0
    }
    public static func stF(p0: Opencls): Opencls {
        println("in cj enum stF ${p0.v}")
        p0.v += 1
        p0
    }

    // aux method to set A_st_OC with Opencls instance created from ObjC side
    public func setStOC() { A_stOC = pOC }
}