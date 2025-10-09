// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    operator func ()(x: Int32): Int32 {
        x
    }
}
class B {
    operator func ()(x: Float32): Float32 {
        x
    }
}
func f(x: Int32): Float32 { Float32(x) }
main() {
    let objA = A()
    let objB = B()
    let af = objA ~> f
    let fb = f ~> objB
    let aa = objA ~> objA
    0
}
