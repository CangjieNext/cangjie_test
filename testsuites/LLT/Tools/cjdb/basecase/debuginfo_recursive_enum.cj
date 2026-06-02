// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E1 {
    B(E2)
}
enum E2 {
    C(E1) | D(Int32)
}
main() {
    var v2 = E2.C(E1.B(E2.D(7)))
    return 0
}
