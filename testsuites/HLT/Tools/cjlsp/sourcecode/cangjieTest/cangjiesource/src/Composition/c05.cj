/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

open class AA {
    static func ss() {}
}
class BB <: AA {}

func hh_1<T>(x: T): T {
    x
}
func hh_2<T>(x: T): T {
    x
}

var res1 = hh_1<BB> ~> hh_2<AA>
var res2 = hh_1<AA> ~> hh_2<AA>

