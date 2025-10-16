// LEVEL: 0
// EXEC: %compiler --disable-inst %f -o %output || true
// ASSERT: scan disable instantiation, CHIR2 translation done.

open class Base {
    var a = 1
    open public func foo() {
        a++
    }
}

class A <: Base {}
class B <: Base {
    override public func foo() {
        a = 10
    }
}

func foo<T>(a: T) where T <: Base {
    var b = a
    b.foo()
    return b.a
}
 
main() {
    var a: A = A()
    var b: B = B()
    return foo<Base>(a) - foo<B>(b) + 8
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
