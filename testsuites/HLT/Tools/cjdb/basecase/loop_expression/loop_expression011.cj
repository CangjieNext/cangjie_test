/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test<T>(args:Array<String>){
    for(arg in args){
        println("${arg}")
    }
}

struct S1<T>{
    init(a:T){
        var count = [1,2]
        for (i in count) {
            println("${i}")
        }
    }
}

main() {
    var a1 = test<Int64>(["ab","cd"])
    var a2 = S1<String>("aa")
    0
}
