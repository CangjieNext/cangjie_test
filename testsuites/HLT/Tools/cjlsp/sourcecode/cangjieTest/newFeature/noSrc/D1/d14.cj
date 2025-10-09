/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.ast.*
//标准库
func test43(){
    var a:ArrayList<Int64> = ArrayList<Int64>()
    a.add(99)
    a[1] = 120

    var m:HashMap<String, Int64> = HashMap<String, Int64>()
    var arr:Array<(String,Int64)> = [("d",11),("e",12)]
    m.add(all: arr)
    m.remove("d")
}
