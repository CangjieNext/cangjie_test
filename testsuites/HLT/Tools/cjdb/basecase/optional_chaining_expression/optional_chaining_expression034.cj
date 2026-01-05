/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

enum E1{
    AB
    static func test() {
        let aa1 = [0,1,2]
        let item1 = ArrayList<Array<Int64>>([aa1])
        let a1 = Option<ArrayList<Array<Int64>>>.Some(item1)
        let a2 = Option<ArrayList<Array<Int64>>>.None
        let r1 = a1?[0]
        let r2 = a2?[0]
    }
}

main() {
    var a =E1.test()
    0
}