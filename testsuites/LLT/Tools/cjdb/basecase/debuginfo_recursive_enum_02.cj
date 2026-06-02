// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E1 {
    A(E1) | B
}

main() {
    var a = B
    var b = A(B)
    var c = A(A(B)) // this one has incorrect format.
    var d = A(A(A(B))) // this one has incorrect format.
    0
}
