// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var g1: Int64 = 2
let g2: Int64 = if (true) {
    g1 = 3
    4
} else {
    0
}
let g3: Int64 = g1

main(): Int64 {
    if (g3 == 3) {
        0
    } else {
        1
    }
}
