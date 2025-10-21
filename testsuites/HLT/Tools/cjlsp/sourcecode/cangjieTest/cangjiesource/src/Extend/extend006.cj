/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

interface I1 {
    func f1(): Unit
}

interface I2 {
    func f2(): Unit
}
interface I3 {
    func f3(): Unit
}

class Foo3 {}
extend Foo3 <: I1 & I2 & I3 {
    public func f1(): Unit {}
    public func f2(): Unit {}
    public func f3(): Unit {}
}

func f6() {
    var y1 = Foo3()
    y1.f1()

}
