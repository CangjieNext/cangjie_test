// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class B{}
class C <: B {}

public open class A<T> {
    var member:T
    init(a:T) {
        member = a
    }
}

main() {
    var a = A<B>(B())
    var a2 = A<C>(C())
    var r = a is A<B>
    var r2 = a2 is A<B>
    0
}