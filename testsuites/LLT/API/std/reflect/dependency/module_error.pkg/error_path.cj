/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package module_error.pkg

public abstract class AbstractClass {
    public func abstractMethod(): Int64

    public func normalMethod(): Int64 {
        42
    }
}

public class ConcreteClass {
    public var mutableVar: Int64 = 100
    public let immutableVar: String = "immutable"

    public init() {}

    public func funcWithTypeCheck(a: Int64): Int64 {
        a
    }
}
