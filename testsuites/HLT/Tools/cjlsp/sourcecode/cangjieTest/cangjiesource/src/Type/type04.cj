/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Type

open class CC {
    static func static_ff1() {}
    func ff2() {}
}

type T1 = CC
class CC2 <: T1 {}
func f4() {
    var c1: T1 = T1()
    T1.static_ff1()
    c1.ff2()
}

extend T1 {}
interface I1 {}
class CC3 <: T1 & I1 {}
