/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public open class A {
    specific public init() {}
}

specific protected open class A2 <: A {
    specific public init() {}
}

specific public sealed abstract class A3 {
    specific public init() {}
}

specific sealed class A4 {
    specific public init() {}
}
