/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.numeric.*
import std.math.*
import std.collection.*

main() {
    let d1 = Decimal("465131.0000")
    let d2 = Decimal("65.4321")
    var map1 = HashMap<Int, Decimal>([(30, d1), (3, d2)])
    var map2 = HashMap<Decimal, Int>([(d1, 2), (d2, 1)])
    var arraylist = ArrayList<Decimal>([d1, d2])
    var hashset: HashSet<Decimal> = HashSet<Decimal>(d1, d2)
    0
}
