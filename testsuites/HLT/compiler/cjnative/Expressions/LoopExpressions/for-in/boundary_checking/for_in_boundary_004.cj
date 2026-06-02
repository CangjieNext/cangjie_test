/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main() {
    let arr1 = Array<Int64>()
    let arr2 = ArrayList<Int64>()
    let map1 = HashMap<String, Int64>()
    let map2 = TreeMap<String, Int64>()
    let set = HashSet<Byte>()

    var count = 0
    for (_ in arr1) {
        count++
    }
    for (_ in arr2) {
        count++
    }
    for (_ in map1) {
        count++
    }
    for (_ in map2) {
        count++
    }
    for (_ in set) {
        count++
    }
    if (count == 0) {
        return 0
    } else {
        return 1
    }
}
