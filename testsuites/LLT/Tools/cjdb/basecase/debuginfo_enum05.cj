// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// optionLike
enum E1 {
    A | B(Int64)
}

enum E2 {
    C | D(C1)
}

enum E3 {
    E | F(S1)
}

class C1 {
    var a = 111
    var b = 222
}

struct S1 {
    var a = 111
    var b = 222
}

main() {
    var z = E1.A
    var x = E1.B(50)
    var c = E2.C
    var v = E2.D(C1())
    var b = E3.E
    var n = E3.F(S1())
    0
}
