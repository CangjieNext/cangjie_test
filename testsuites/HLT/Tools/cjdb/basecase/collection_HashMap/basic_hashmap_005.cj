/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public func test3(par_1: Rune): HashMap<Int32, Rune> {
    var map_subcla_fun_s1: HashMap<Int32, Rune> = HashMap<Int32, Rune>([(1, r'Z')])
    map_subcla_fun_s1.add(Int32(map_subcla_fun_s1.size), par_1)
    return map_subcla_fun_s1
}

main() {
    var a = test3(r'A')
    0
}
