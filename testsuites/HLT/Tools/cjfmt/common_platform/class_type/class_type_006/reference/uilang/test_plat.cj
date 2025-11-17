/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public open class A {
    platform public init() {}
}

platform protected open class A2 <: A {
    platform public init() {}
}

platform public sealed abstract class A3 {
    platform public init() {}
}

platform sealed class A4 {
    platform public init() {}
}
