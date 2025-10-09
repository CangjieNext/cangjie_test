/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

var vcarrc1:Array<Int64> = [1,2,3+1]
var vcarrc2 = [2,vcarrc1]
var vcarrc3 = vcarrc2[0]
var vlist2 = ArrayList<Int64>([1, 2>>1])
public var vhmc: HashMap<String, Bool> = HashMap<String, Bool>([("a", true),("b", true)])
var vhmc3 = vhmc.add("c",true)

main(): Int64 {
    let aa:Range<Int64> = 0..6:2
    for (i in aa) {
        println(i)
    }
    return 0
}
