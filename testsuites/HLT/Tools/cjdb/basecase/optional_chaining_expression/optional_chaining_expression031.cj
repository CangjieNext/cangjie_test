/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class C1 {
    let c = ArrayList<Int64>([0, 1, 2])
    let a1 = Option<ArrayList<Int64>>.Some(c)
    let a2 = Option<ArrayList<Int64>>.None
    var arr: VArray<Int64, $3> = [1, 2, 3]
    let a3 = Option<VArray<Int64, $3>>.Some(arr)
    let a4 = Option<VArray<Int64, $3>>.None
    let r1 = a1?[2]
    let r2 = a2?[2]
    let r3 = a3?[2]
    let r4 = a4?[2]
}

main() {
    var a= C1().r1
    0
}
