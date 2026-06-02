// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//enum with NonRef
enum E1 {
    A(Int64) | B(VArray<C1, $2>) | C((C1, C1))
}

struct C1 {
    var a = 10
}

main() {
    var a = E1.A(50)
    var b = E1.B([C1(), C1()])
    var c = E1.C((C1(), C1()))
    0
}
