// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    func test<T1, T2>(f: (T1) -> T2, a: T1): T2 {
        f(a) //expr f(a)
    }
}

main() {
    var a = A() //expr a or expr A()
    var b = a.test({i => i}, 1) //expr a.test({i => i}, 1)
    return 0
}
