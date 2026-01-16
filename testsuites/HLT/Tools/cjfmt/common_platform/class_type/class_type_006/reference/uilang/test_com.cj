/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public open class A {
    common public init()
}

common protected open class A2 <: A {
    common public init()
}

common public sealed abstract class A3 {
    common public init()
}

common sealed class A4 {
    common public init()
}

public func test_com() {
    A()
}
