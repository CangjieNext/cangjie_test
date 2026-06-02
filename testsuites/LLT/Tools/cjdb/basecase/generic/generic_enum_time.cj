// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Foo {
    public var dt1: Int32 = 2
}

class Bar <: Foo {
    public var dt: Int32 = 4
}

enum Time<T> where T <: Foo {
    Day(T)
}

main(): Int64 {
    var bar: Bar = Bar()
    var time = Time<Bar>.Day(bar) //expr time
    return 0
}
