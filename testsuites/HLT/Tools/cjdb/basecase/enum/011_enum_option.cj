/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
enum C {
    | C1(?Int64) | C2(Option<Float32>) | C3(?ArrayList<Rune>) | C4(?HashSet<Float64>) | C5(C)
}

main() {
    var c1 = C.C1(Some(16))
    var c2 = C.C2(Some(2.4e-1))
    var c3 = C.C3(Some(ArrayList<Rune>([r'c', r'a', r'n', r'g', r'j', r'i', r'e'])))
    var c4 = C.C4(HashSet<Float64>([16.0, 128.0]))
    var c5 = C.C5(C.C1(None))
    0
}
