// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// case 1
enum E {
    A | B(S)
}

struct S {
    var x: E = E.A
    init() {
    }
}

main() {
    var sa = S()
    sa.x = E.A
    0
}
