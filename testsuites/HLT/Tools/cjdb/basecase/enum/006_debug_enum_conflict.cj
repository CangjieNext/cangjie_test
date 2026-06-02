/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




package p

var A = 0 // conflict with A
var F: (Int64)->Int64 = { i => i } // conflict with F
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


main() {
    let b = E.A // ok
    let c = A // ok

    let d = E.F(1) // ok
    let e = F(1) // ok

    let f = R.C(1) // ok


    return 0
}
