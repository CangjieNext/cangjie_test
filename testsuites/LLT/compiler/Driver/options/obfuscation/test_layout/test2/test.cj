// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import mymod.mod1
import mymod.mod2
import std.collection.*

func main_func(a: Int64) {
    println(a)
}

var main_global = 10

public func myfunc3() {
    println("aaaaaaaa")
}

main() {
    let mca = mod1.MyClassA()
    let mcb = mod2.MyClassA()
    var res: ArrayList<Int64> = ArrayList([1, 2, 3, 4])
    var ac: (Int64, Int64) = mod1.ToPair.fromArray<Int64>(res)
    var ac2: (Int64, Int64) = mod1.ToPair2.fromArray<Int64>(res, c: "hahahah")
    var asp: mod1.Pair<String, Int64> = mod1.Pair<String, Int64>("hello", 0)
    let node = mod1.Node<Int64, String>(10, "aaaaa");
    let arr: ArrayList<mod1.Node<Int64, String>> = ArrayList([node]);
    println("${node > 20}")
    arr[0].print()
    arr[0].mynodefunc1(10, "nnnnnnnnn", c: 2000)
    arr[0].mynodefunc4(mod1.RGBColor.Green(100))
    let b = arr[0].mynodefunc5()
    println("b = ${b()}")
    let c = mod1.returnIncrementer()
    let d = arr[0].mynodefunc5("hahahaha")
    println("d = ${d()}")
    mod1.Node<Int64, String>.mynodefunc2<String>("nnnnnnnnn", c: 2000)
    println(mod1.Node<Int64, String>.NodeID)
    mod1.Node<Int64, String>.NodeID = 200
    println("${arr[0].toString()}")
    arr[0].mynodefunc3<mod1.Node<Int64, String>>(arr[0], arr[0], c: 200, d: 40.0)
    mod1.Node<String, mod1.Node<Int64, String>>.fromArray<Int64>(res)
    print("${ac[0]}")
    println(asp.first())
    println("${mca.field_a}")
    println("${mcb.field_a}")
    println("${mod1.globalA}")
    mca.myfunc1(3, 4.0)
    main_func(main_global)
    return 0
}
