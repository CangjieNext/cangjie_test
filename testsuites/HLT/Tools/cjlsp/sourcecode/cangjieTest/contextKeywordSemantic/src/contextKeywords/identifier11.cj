/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

abstract class C6 {
    public func abstract(): Unit
    public func public(): Unit
}

interface I2 {
    func override(): Unit
    static func protected(): Unit
}

class C7 <: I2 {
    public func override(): Unit {}
    public static func protected(): Unit {}
}

func test11() {
    var c1 = C7().override
}
