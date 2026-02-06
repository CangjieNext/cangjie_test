/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public let sGlobal: S = S(888)

// The test checks if a struct can be used as an arg/result of an enum method
public enum A {
    | E1
    | E2(S)

    public prop pS: S {get(){sGlobal}}
    public static prop stpS: S {get(){sGlobal}}

    public func fooStruct(s: S): S {
        println("in cangjie fooStruct, ${s.i64}")
        match(this) {
            case E2(payload) => payload
            case _ => s
        }
    }
    public func implicitFooStruct(s: S) { println("in cangjie implicitFooStruct, ${s.i64}"); s}
    public static func stFooStruct(s: S): S { println("in cangjie stFooStruct, ${s.i64}"); s}
}

public struct S {
    public var i64: Int64 = 1
    public init(a: Int64) { i64 = a }
}
