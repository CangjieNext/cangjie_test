/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Interface

interface I1 {
    func f(a: Int32): Unit {}
}
interface I2 {
    func f(a: Int32): Unit {}
}
open class InterfaceA {
    open func f(a: Int32): Unit {}
}

class InterfaceB <: InterfaceA & I1 & I2 {
    public func f(a: Int32): Unit {}
}

func main10() {
    InterfaceA()
    InterfaceB().f(9)

}
