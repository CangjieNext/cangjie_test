/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Rectangle {
    var al: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
}

main(): Int64 {
    let op1: Option<Option<Rectangle>> = Some(Some(Rectangle()))
    let lambda1 = {a:Option<Option<Rectangle>> =>
        println("lamdda.....")
    }(op1)
    return 0
}
