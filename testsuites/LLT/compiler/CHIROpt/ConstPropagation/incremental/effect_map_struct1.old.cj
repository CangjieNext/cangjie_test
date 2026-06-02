// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct SA {
    var x = 1
    var y = 1
}

var g1 = SA()
let g2 = if (true) {
    g1.x = 1
    g1.y = 3
    g1.x + g1.y
} else {
    foo();
    0
}
let g3 = SA()
let g4 = if (true) {
    g3.x + g3.y
} else {
    foo();
    0
}

func foo() {
    g1.x = 999
}

main(): Int64 {
    var a = g2
    var b = g4
    if (a == 4 && b == 2) {
        return 0
    } else {
        return 1
    }
}
