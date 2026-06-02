// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %enableFuncInlining %f -o %n.%suffix
// EXEC-1: %run %run_opt %n.%suffix

class A<XXX> {
    let x: XXX
    init(y: XXX) {
        x = y
    }
    func foo<YYY>() {
        func goo1(a: XXX) {
            func goo2<ZZZ>() {
            }
            goo2<XXX>()
            a
        }
        goo1(x)
    }
}

main() {
    A<Int64>(1).foo<Int32>()
}
