/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

open class C1 {
    var arr1: ArrayList<String> = ArrayList<String>(["hello","Cangjie"])
}

class C2 <: C1 {
    public var arr2: ArrayList<Int64>

    public init () {
        super()
        arr2 = ArrayList<Int64>([1,2,3])
    }
}

main() {
    var c1 = C1()
    var c2 = C2()
}
