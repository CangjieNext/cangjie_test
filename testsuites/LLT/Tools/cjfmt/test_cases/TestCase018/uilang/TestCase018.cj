// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p
    var A = 0 // conflict with A
    var F: (Int64)->Int64 = { i => i } // conflict with F
    enum RGBColor {
        | Red | Green | Blue(UInt8,String) // 3个构造器： 第一个 | 可以不写
    }

enum E {
    | A // conflict with A
    | F(Int64) // conflict with F
}

enum R {
    | C(Int64) // conflict with C
}

enum C { // conflict with C
    | B
}

func g() {
    let a = A
    let b = E.A // ok
    let c = p.A // ok
    F(1)
    E.F(1) // ok
// p.F(1) // ok
    let x: C // error
    let y: p.C
}

main(){
    var A = 0 // conflict with A
    var F: (Int64)->Int64 = { i => i } // conflict with F
    g()
    return 0
}