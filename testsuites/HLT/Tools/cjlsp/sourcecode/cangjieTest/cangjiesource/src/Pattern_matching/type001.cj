/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pattern_matching

open class Base {
    var a: Int64
    init() {
        a = 10
    }
}
class Derived <: Base {
    init() {
        a = 20
    }
}

func test10() {
    var d = Derived()
    var r = match (d) {
        case b: Base => b.a //匹配成功
        case _ => 0
    }

    var b = Base()
    var r1 = match (b) {
        case d: Derived => d.a //匹配失败
        case _ => 0
    }
}
