// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-8: %run %run_opt %output %run_args

open class Base {
    var a = 1
    func foo() {
        a++
    }
}

class A <: Base {}
class B <: Base {}

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
