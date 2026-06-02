// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*

var ga = HashSet<Int64>([0, 1, 2])
var gb = HashSet<String>(["ab", "cd", "ef"])
main() {
    // member access
    var la = HashSet<Int64>([0, 1, 2])
    var lb = HashSet<String>(["ab", "cd", "ef"])
    for (i in ga) {
        println("The element is ${i}")
    }
    for (i in gb) {
        println("The element is ${i}")
    }
    // assign 
    ga.contains(0)
    ga.add(5)
    ga.remove(0)
    0
}
