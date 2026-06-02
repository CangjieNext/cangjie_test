// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var a = 100
    func goo(para: () -> Int64) {
        para()
        return 500
    }

    func foo() {
        goo(
            { =>
                a = 200
                return a
            }
        )
        println(a)
    }
}

main() {
    var cls = A()
    cls.foo()
    0
}
