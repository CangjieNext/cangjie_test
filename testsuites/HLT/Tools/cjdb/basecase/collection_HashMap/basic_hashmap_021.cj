/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func f<T>(input: T): T {
    input
}

func test<T>(input: T): HashMap<Int64, Int64> {
    return HashMap<Int64, Int64>([(1, 1)])
}

main(): Int64 {
    var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
    var a = test<Int64>(1)
    var b = f<HashMap<Int64, String>>(HashMap<Int64, String>([(1, 'a')]))
    0
}
