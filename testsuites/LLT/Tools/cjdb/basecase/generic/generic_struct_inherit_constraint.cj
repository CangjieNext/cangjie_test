// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I {
    operator func ()(x: Int) {
        x - 1
    }
}

struct A {}

extend A <: I {}

struct Test<T> where T <: I {
    func test(f: T) {
        return f(1)
    }
}

main(): Int64 {
    var a = Test<I>().test(A()) //expr Test<I>().test(A())
    return 1
}
