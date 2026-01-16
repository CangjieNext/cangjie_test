/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public struct A<T> {
    platform private func f(): Int64 {
        0
    }
    platform public var a: Int64 = 1
    platform public static var b: Int64 = 2
}

platform protected struct A2<T> {
    platform protected func f(): Int64 {
        1
    }
    platform private static func f2<T>(): Int64 {
        3
    }
}

public func test_plat() {
    A().f(0)
}
