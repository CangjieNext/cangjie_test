/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct S1<T>{
    init(a:T){
        let aa1 = [0,1,2]
        let item1 = ArrayList<Array<Int64>>([aa1])
        let d1 = [(1)]
        let a1 = Option<ArrayList<Array<Int64>>>.Some(item1)
        let a2 = Option<ArrayList<Array<Int64>>>.None
        let a3 = Some(d1)
        let r1 = a1?[0]
        let r2 = a2?[0]
        let r3 = a3?[0]
    }
}

main() {
    var a = S1<String>("qqq")
    0
}