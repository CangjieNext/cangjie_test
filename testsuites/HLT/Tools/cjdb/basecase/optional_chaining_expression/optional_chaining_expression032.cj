/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class C1{
    func test() {
        let ab1 = [0,1,2]
        let item1 = ArrayList<Array<Int64>>([ab1])
        let d1 = [(1,2),("3",4),(true,r'a')]
        let item2 = [d1]

        let a1 = Option<ArrayList<Array<Int64>>>.Some(item1)
        let a2 = Option<ArrayList<Array<Int64>>>.None
        let a3 = Option<Array<Any>>.Some(d1)
        let a4 = Option<Array<Any>>.None

        let r1 = a1?[0]
        let r2 = a2?[0]
        let r3 = a3?[0]
        let r4 = a4?[0]
    }
}

main() {
    var a = C1().test()
    0
}