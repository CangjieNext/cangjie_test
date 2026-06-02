// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

main() {

    let array01:Array<Int64>=[1,2,3,4,5]

    let r5 = Range<Rune>(r'a',r'z', 1, true, true, true) 
    let r6 = Range<Int64>(10, 0, -2, true, true, false) 
    let lambda1 = { a:Range<Rune>, b:Range<Int64> =>
        let r8 = 10..=0 : -2 // r4 contains 10, 8, 6, 4, 2, 
        println(array01)
        println("lamdda.....")
    }(r5, r6) 

    let arraylist01 = ArrayList<Int64>([0, 1, 2])
    return 0
}
