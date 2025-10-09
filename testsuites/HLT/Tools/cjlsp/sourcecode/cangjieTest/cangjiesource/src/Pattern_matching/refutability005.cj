/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

interface I {}

open class Base1 <: I {
    var a: Int64
    init() {
        a = 10
    }
}
class Derived1 <: Base1 {
    init() {
        a = 20
    }
}

func typePat(x: I) {
    match (x) {
        case a: Derived1 => "Derived"
        case b: Base1 => "Base"
        case _ => "other"
    }
}
