/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public open class A {
    var a: Int64
    var b: Int64
    specific public const init() {
        a = 1
        b = 2
    }
}

specific public struct S {
    var a: Int64
    var b: Int64
    specific public const init() {
        a = 1
        b = 2
    }
}
