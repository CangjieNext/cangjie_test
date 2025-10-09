/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

let hashmap01 = HashMap<Rune, Int64>([(r'a', 10), (r'b', 20), (r'c', 30)])
var hashmap03 = HashMap<Int16, Bool>([(0, false), (1, true), (2, true)])
let hashmap05 = HashMap<Bool, HashSet<Int32>>([(false, HashSet<Int32>([0, 1])), (true, HashSet<Int32>([10, 11]))])

func test_hashmap(a:HashMap<Bool, UInt64>) {
    return a
}

main(): Int64 {
    var hashmap02 = HashMap<Bool, UInt64>([(true, 10), (false, 20)])
    let hashmap_lambda = {a:HashMap<UInt64, String> =>
        a
    }(HashMap<UInt64, String>([(10, "aa"), (20, "bb"), (30, "cc")]))
    let hashmap04 = HashMap<String, Rune>([("aa", r'a'), ("bb", r'b'), ("cc", r'c')])
    var hashmap_lambda02 = {a:HashMap<Rune, Array<UInt8>> =>
        a
    }(HashMap<Rune, Array<UInt8>>([(r'a',[11, 12]), (r'b', [21, 22])]))
    var hashmap06 = HashMap<UInt16, ArrayList<UInt32>>([(10, ArrayList<UInt32>([11, 12])), (20, ArrayList<UInt32>([21, 22]))])
    let hashmap_lambda03 = {a:HashMap<Int8, HashMap<UInt8, Int64>> =>
        a
    }(HashMap<Int8, HashMap<UInt8, Int64>>([(10, HashMap<UInt8, Int64>([(11, 12)])), (20, HashMap<UInt8, Int64>([(21, 22)]))]))
    test_hashmap(hashmap02)
    let hashmap_lambda04 = {a:HashMap<Int16, Bool> =>
        a
    }(hashmap03)

    return 0
}
