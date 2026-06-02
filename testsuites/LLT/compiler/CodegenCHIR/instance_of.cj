// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

open class CA {
    var x = 2
}

class CB <: CA {}

func foo(x: CA) {
    return x is CB
}

main() {
    if (foo(CB())) {
        0
    } else {
        1
    }
}
