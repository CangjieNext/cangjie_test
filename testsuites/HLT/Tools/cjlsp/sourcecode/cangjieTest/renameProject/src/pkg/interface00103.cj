/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

interface _I1 {
    func f(a: Int32): Unit {}
}
interface _I2 {
    func f(a: Int32): Unit {}
}
open class _A {
    public open func f(a: Int32): Unit {}
}

class _B <: _A & _I1 & _I2 {
    public func f(a: Int32): Unit {}
}

func main10() {
    _A()
    _B().f(9)

}
