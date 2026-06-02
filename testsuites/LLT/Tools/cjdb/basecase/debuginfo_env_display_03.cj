// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E {
    Default | Ctor(String)
}

struct S {
    let a = Default
    let b = [1]
    let c = Ctor("HHH")
    func goo(para: () -> E) {
        para()
        return 500
    }

    func foo() {
        goo({
            => return a
        })
    }
}

main() {
    var stru = S()
    stru.foo()
    0
}
