/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

open class AAA {
    static func ss() {}
}
class BBB <: AAA {}

func hh_1<T>(x: T): T {
    x
}
func hh_2<T>(x: T): T {
    x
}

var res1 = hh_1<BBB> ~> hh_2<AAA>
var res2 = hh_1<AAA> ~> hh_2<AAA>

