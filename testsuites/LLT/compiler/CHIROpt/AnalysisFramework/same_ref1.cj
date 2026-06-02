// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler %cmp_opt %f -o %output

class CA {
    var x = 1
}

func foo(cond: Bool): Unit {
    var a: CA = CA()
    var b: CA = CA()

    while (true) {
        if (cond) {
            a = b
        } else {
            b = a
        }
    }
}

main() {
    0
}
