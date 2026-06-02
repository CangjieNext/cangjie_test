// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct SA {
    var x = 3
    var y = 2
}

var g1 = SA()
let g2 = if (true) {
    g1.x = 5
    g1.y = 7
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
    if (a == 12 && b == 5) {
        return 0
    } else {
        return 1
    }
}
