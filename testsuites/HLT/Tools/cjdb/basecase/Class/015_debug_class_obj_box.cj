/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





interface I {}
class A <: I {}

class Box<T> {
    public var value: T
    public init(value: T) {
        this.value = value
    }
}



main() {
    var a : Object = A() // OK, class `A` is a subtype of `Object`.
    var c : I = A()
    let a1 = 1
    var a2 = 2
    let b1 = Box(1)
    var b2 = Box(2)
    var a11 = Box(a1)
    b2 = Box(3)
    return 0
}



