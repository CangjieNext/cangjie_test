// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*

var ga = ArrayList<Int64>([0, 1, 2])
var gb = ArrayList<String>(["ab", "cd", "ef"])

main() {
    var la = ArrayList<Int64>([0, 1, 2])
    var lb = ArrayList<String>(["ab", "cd", "ef"])
    ga[0]
    ga[0] = 5 // modify
    ga[0]
    ga.add(3)
    ga.add(4)
    let li = [2, 3]
    ga.add(all: li) // modify
    gb[0]
    la[0]
    la[0]
    0
}
