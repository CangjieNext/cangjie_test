/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public struct A {
    specific private func f(): Int64 {
        0
    }
    specific public var a: Int64 = 1
    specific public static var b: Int64 = 2
}

specific protected struct A2 {
    specific protected func f(): Int64 {
        1
    }
    specific private static func f2(): Int64 {
        3
    }
}

public func test_plat() {
    A().f(0)
}
