/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    let a1 = [1.0,2.0,3.0]
    let a2 = [a1]
    let b1 = HashMap<String, Int64>([("a",1),("b",2)])
    let b2 = [b1]
    for (i in a2) {
        println("${i}")
    }
    for (j in b2 ){
        println("${j}")
    }
    0
}
