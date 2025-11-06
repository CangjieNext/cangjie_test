/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import interoplib.objc.*

public struct A {
    public var a: Int64 = 2
    public init(a: Int64, b: Float64, c: Bool) {
        println("in cangjie init, ${a}, ${b}, ${c}")
    }

    public func foo() {
        1
    }

    public mut prop p: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }

    public static func goo() {
        5
    }
}
