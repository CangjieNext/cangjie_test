/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

let hashset01 = HashSet<Int8>([80, 81, 82])
let hashset02 = HashSet<Int16>([160, 161, 162])
let hashset03 = HashSet<Int32>([320, 321, 322])
let hashset04 = HashSet<Int64>([640, 641, 642])
var hashset05 = HashSet<Bool>([true, false])
let hashset06 = HashSet<Range<Int64>>([1..10, 11..20 : 1])

func test_hashset(a: HashSet<UInt8>) {
    return a
}

main(): Int64 {
    var hashset11 = HashSet<UInt8>([10, 11, 12])
    var hashset12 = HashSet<UInt16>([20, 21, 22])
    var hashset13 = HashSet<UInt32>([30, 31, 32])
    var hashset14 = HashSet<UInt64>([40, 41, 42])
    let hashset_lambda = {a:HashSet<Float64> =>
        a
    }(HashSet<Float64>([10.1, 20.2]))
    let hashset15 = HashSet<String>(["aa", "bb"])
    var hashset_lambda02 = {a:HashSet<Rune> =>
        a
    }(HashSet<Rune>([r'1', r'2', r'a']))
    test_hashset(hashset11)
    let hashset_lambda03 = {a:HashSet<Bool> =>
        a
    }(hashset05)

    return 0
}
