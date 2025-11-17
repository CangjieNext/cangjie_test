/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public struct A<T> {
    common public var a: Int64
    common public static var b: Int64
    common private func f(): Int64
    common public func f(a: T): T {
        a
    }
}

common protected struct A2<T> {
    common protected func f(): Int64
    common private static func f2<T>(): Int64
}

public func test_com() {
    A().f(0)
}
