/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class Circle{
    Circle(var radis:Int64){}
}

main() {
    let circleMap = HashMap<String,Circle>()
    circleMap.add("small",Circle(1))
    circleMap.add("large",Circle(2))

    for(item in circleMap)
    {
        println(item[0])
    }
}
