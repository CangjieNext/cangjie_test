/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Composition

open class Foo {
    public static func f(a: Int64) :Int64{
        return 1
    }
}
class Foo1 <: Foo {
    public static redef func f(a: Int64) :Int64{
        return 1
    }
}

var a :Int64 = Foo.f(1)
var b :Int64= Foo1.f(2)
var ab1 = Foo.f ~> Foo1.f
var ab2 = Foo1.f ~> Foo.f
var ab3 = Foo.f ~> {a: Int64 => a}

