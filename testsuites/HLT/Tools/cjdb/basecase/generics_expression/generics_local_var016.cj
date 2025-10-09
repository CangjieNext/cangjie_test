/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rect1<T> {
    init(a:T){
        var bb = [2]
        var aa:(Int64,T) = (1,a)
        var vhmc = HashMap<String, Int64>([("a", 1)])
    }
}

struct Rect2<T> {
    init(a:T){
        var bb = [2]
        var aa:(Int64,T) = (1,a)
        var vhmc = HashMap<String, Int64>([("a", 1)])
    }
}

main(): Int64 {
    var a1 = Rect1<Int64>(2)
    var a2 = Rect2<Float64>(1.2)
    return 0
}
