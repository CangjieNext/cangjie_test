// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    func test() {
        var a = 0
        let b = a
        println(a + b)
    }
}

struct B {
    func test() {
        var a = 0
        let b = a
        println(a + b)
    }
}

extend A {
    func test2() {
        var a = 0
        let b = a
        println(a + b)
    }
}

main() {}