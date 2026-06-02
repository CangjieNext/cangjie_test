// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum E {
    A | B(S)
}

struct S {
    var x: E
    init() {
        x = E.A
    }
}

main() {
    var a = S()
    var b = S()
    a.x = b.x
    0
}
