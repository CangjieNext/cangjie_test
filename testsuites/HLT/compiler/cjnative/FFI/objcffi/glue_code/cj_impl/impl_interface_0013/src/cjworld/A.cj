/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public interface I {
    public func f(): Unit
}
private class DefaultI <: I {
    public func f(): Unit {throw Exception("Must not be used")}
}
public struct S {
    public var i: I
    public let constI: I
    public static var stI: I = DefaultI()
    public static var stConstI: I = DefaultI()

    public prop p: I {get(){i}}
    public mut prop mutP: I {get(){i} set(v) { i = v }}
    public static prop stP: I {get(){stI}}
    public static mut prop stMutP: I {get(){stI} set(v) { stI = v }}

    public init(a: I) {i = a; constI = a; a.f()}
    public func f1(a: I):I {a.f(); a}
    public func implicitf1(a: I) {a.f(); a}
    public mut func mutf1(a: I):I {a.f(); a}
    public static func f2(a: I):I {a.f(); a}
    public static func initStI(a: I) {stI = a; stConstI = a}
}
