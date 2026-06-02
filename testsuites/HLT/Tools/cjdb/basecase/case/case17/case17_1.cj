/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

var tuple00 = (3, 4)
var mixtuple01 = [1, 2, tuple00]
let tuple01: (Int64, Int64) = (1, 2)
let b1 = (tuple00, tuple01)
let d1: Array<(Int64, Int64)> = [tuple00]
let a1 = (1, true)
let c1 = (((a1), (6)))
let e1 = ArrayList<(Int64, Bool)>([(1, true)])
let f1 = HashMap<String, (Int64, Int64)>([("a", (1, 2))])

main(): Int64 {
    var tuple00 = (3, 4)
    var mixtuple01 = [1, 2, tuple00]
    let tuple01: (Int64, Int64) = (1, 2)
    let b = (tuple00, tuple01)
    let d: Array<(Int64, Int64)> = [tuple00]
    let a = (1, true)
    let c = (((a), (6)))
    let e = ArrayList<(Int64, Bool)>([(1, true)])
    let f = HashMap<String, (Int64, Int64)>([("a", (1, 2))])
    return 0
}
