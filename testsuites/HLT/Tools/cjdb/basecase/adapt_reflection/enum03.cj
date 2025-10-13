enum E1 {
    A | B(E2)
}

enum E2 {
    C(E1) | D(Int64)
}

enum E3 {
    C(E3) | D(Int64)
}

main() {
    var a1 = E1.B(E2.C(E1.A))
    var a2 = E1.B(E2.D(2))
    var a3 = B(E2.D(2))
    var a4 = B(D(8))
    var a5 = B(C(A))
    var a6 = E3.C(E3.C(E3.D(4)))
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
