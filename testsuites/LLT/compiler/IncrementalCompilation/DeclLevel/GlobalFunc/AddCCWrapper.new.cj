func foo() {1}

class A {
    func bar() {0}
    static func got() {3}
}

func u1(): Int64 {
    let a=foo;
    let b=A()
    let c=b.bar 
    let d=A.got 
    a()+c()+d() // 1+0+3=4
}

main() {
    u1()
}

func foo_cc_wrapper() {-1}
let bar_cc_wrapper = { => -2 }
var got_cc_wrapper = { => -3 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
