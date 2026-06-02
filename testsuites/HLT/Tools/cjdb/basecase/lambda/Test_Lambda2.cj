/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main(): Int64 {
    let num: UInt32 = 99
    let arraylist1:ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    let array01:Array<Int64>=[1, 2, 3]
    let lambda1 = { a:UInt32, b:ArrayList<Int64> =>
        var tuplevar01 = (true, false)
        println(array01)
        println("lamdda.....")
     }(num, arraylist1)
    return 0
}
