// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E1 {
    defaultE11 | defaultE12

    func foo() { 0 }
}

enum E2 {
    defaultE21 | defaultE22 | defaultE23
}

main() {
    var a = E1.defaultE11
    var b = E1.defaultE12
    var c = E2.defaultE21
    var d = E2.defaultE22
    0
}
