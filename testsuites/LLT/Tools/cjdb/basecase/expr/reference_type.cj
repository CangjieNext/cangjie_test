// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

var arrg = [0, 1, 2]
var varrg: VArray<Int64, $3> = [0, 1, 2]
var tupg = (0, false)
let mapg = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
let setg = HashSet<Int64>([0, 1, 2])
let arrlg = ArrayList<Int64>([0, 1, 2])

main() {
    var arr = [0, 1, 2]
    var a = arr[0]
    var varr: VArray<Int64, $3> = [0, 1, 2]
    var tup = (0, false)
    var boo = tup[1]
    let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let set = HashSet<Int64>([0, 1, 2])
    let arrl = ArrayList<Int64>([0, 1, 2])
    0
}
