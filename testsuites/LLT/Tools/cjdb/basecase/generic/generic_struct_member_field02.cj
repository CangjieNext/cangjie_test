// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

struct A<T> {
    public var value: T
    init(a: T) {
        value = a
    }
}

let array1: Array<Int64> = [1, 2, 3]
let arrayList1: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
let hashset1: HashSet<Int64> = HashSet<Int64>([0, 1, 2])
let hashmap1: HashMap<String, Int64> = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])

main() {
    A<Array<Int64>>(array1)
    A<ArrayList<Int64>>(arrayList1)
    A<HashSet<Int64>>(hashset1)
    A<HashMap<String, Int64>>(hashmap1)
    0
}
