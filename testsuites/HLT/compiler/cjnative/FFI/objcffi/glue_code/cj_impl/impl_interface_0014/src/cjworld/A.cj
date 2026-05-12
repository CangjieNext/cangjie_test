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

private var S_stI: I = DefaultI()
public class S {
    public var varI: I
    public prop pI: I         {get(){varI}}
    public static prop stI: I {get(){S_stI}}

    public init(a: I) { varI = a; a.f()}
    public func f1(a: I) {a.f()}
    public func resI(a: I): I {a.f(); a}
    public static func f2(a: I) {a.f()}
    public static func stResI(a: I): I {a.f(); a}
    public static func initStI(a: I) {S_stI = a}
}
