/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class A{
    let a = 1..5
    let b = ArrayList<String>(2,{x:Int64=>x.toString()})
    let c = HashSet<Int64>([0,1,2])
    let d = HashMap<String, Int64>([("a",0),("b",1)])
    let e = [1,[3,4]]
    var mixtuple00 = ('a','b')
    var mixtuple01 = (18,'a',[1,2,3])
    var mixtuple02 = (true,"hello",mixtuple01,mixtuple00)
    var mixtuple03 = (1,2,a)
    var mixtuple04 = (b)
    var mixtuple05 = ("ab",c)
    var mixtuple06 = (3,4,d)
    var mixtuple07 = (e,a)
    var mixtuple08 = ((),())
}

main():Int64 {
    var x1 = A()
    var x2 = x1.mixtuple01
    var x3 = x1.mixtuple02
    var x4 = x1.mixtuple03
    var x5 = x1.mixtuple08
    return 0
}
