// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*
enum RGBColor {
    | Red | Green | Blue(Int64, HashSet<Int64>) | Yellow(Array<Range<Int64>>)
}
main() {
    let c = RGBColor.Yellow([1..10 : 2, 1..10 : 3])
    let c2 = RGBColor.Blue(3, HashSet<Int64>([0, 1, 2]))
    let cs = match (c) {
        case Green => "Green"
        case Yellow(_) => "Blue"
        case Red => "red"
        case _ => "red"
    }
    print(cs)
    if (cs == "Blue") {
        return 0
    }
    return 1
}
