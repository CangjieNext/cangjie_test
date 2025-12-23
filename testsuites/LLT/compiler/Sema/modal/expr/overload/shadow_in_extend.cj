// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class C {
    init() {}
    init(this @local!) { exclave {} }
    func foo(a: Int) {
        println(a)
    }
}

extend C {
    func bar(this @local!, a: Int) {
        println("local! ${a}")
    }
}

main() {
    let c: C @~local = C()
    c.foo(1)

    let d: C @local! = C()
    d.bar(2)
}