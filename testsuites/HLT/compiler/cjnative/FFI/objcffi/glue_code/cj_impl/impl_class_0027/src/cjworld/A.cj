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
    public func f() { println("in cj NonOpen(${v}).f()"); v += 1 }
}

public struct S {
    public var no: NonOpen
    public var implicitNO = NonOpen(21)
    public let constNO: NonOpen = NonOpen(31)
    public static var stNO: NonOpen = NonOpen(91)
    public static let stConstNO: NonOpen = NonOpen(71)

    public prop p: NonOpen {get(){no}}
    public mut prop mutP: NonOpen {get(){no} set(v) { no = v }}
    public static prop stP: NonOpen {get(){stNO}}
    public static mut prop stMutP: NonOpen {get(){stNO} set(v) { stNO = v }}

    public init(a: NonOpen) {no = a; a.f() }
    public func foo(a: NonOpen):NonOpen {a.f(); a}
    public func implicitFoo(a: NonOpen) {a.f(); a}
    public static func stFoo(a: NonOpen):NonOpen {a.f(); a}
}