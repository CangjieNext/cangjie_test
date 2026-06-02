/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

open class C1 {
    open func f(a: Float64) {
        return 1.2
    }
}

class C2 <: C1 {
    override func f(a: Float64) {
        return 1.2
    }
    func fff(a: Float64) {
        return 1
    }
}

let m1 = C2()
let n1 = C1()

var m2 = m1.f ~> n1.f
var m3 = m1.f ~> m1.fff

var n2 = n1.f ~> n1.f
