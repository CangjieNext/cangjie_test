// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output 
// RUN_EXEC: %output

open class Base0<T> {
    public open func foo() { }
}
open class Base1<T> <: Base0<T> { }
open class Base2<T> <: Base1<T> { }
open class Base3<T> <: Base2<T> { }
open class Base4<T> <: Base3<T> { }
open class Base5<T> <: Base4<T> { }
open class Base6<T> <: Base5<T> { }
open class Base7<T> <: Base6<T> { }
open class Base8<T> <: Base7<T> { }
open class Base9<T> <: Base8<T> { }
open class Base10<T> <: Base9<T> {
    public func foo() {
        let _ = Base0<T>()
    }
}
open class Base11<T> <: Base10<T> { }
open class Base12 <: Base11<Base12> { }

main() {
    let d: Base0<Base12> = Base12()
    d.foo()
}