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
    public func f() { println("in cj Opencls(${v}).f()"); v += 1 }
}

public struct S {
    public var oc: Opencls = Opencls(666)
    public var implicitOC = Opencls(21)
    public let constOC: Opencls = Opencls(31)
    public static var stOC: Opencls = Opencls(91)
    public static let stConstOC: Opencls = Opencls(71)

    public prop p: Opencls {get(){oc}}
    public mut prop mutP: Opencls {get(){oc} set(v) { oc = v }}
    public static prop stP: Opencls {get(){stOC}}
    public static mut prop stMutP: Opencls {get(){stOC} set(v) { stOC = v }}

    public init() { }
    public init(a: Opencls) {oc = a; a.f() }
    public func foo(a: Opencls):Opencls {a.f(); a}
    public func implicitFoo(a: Opencls) {a.f(); a}
    public static func stFoo(a: Opencls):Opencls {a.f(); a}
}