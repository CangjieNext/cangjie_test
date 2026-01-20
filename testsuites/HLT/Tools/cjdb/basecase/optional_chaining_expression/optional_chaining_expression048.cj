/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
import std.collection.*

func func1(a:ArrayList<Int64>){
    a
}

func func2(a:Array<Int64>){
    a
}

func func3<T>(a:T){
    a
}

main() {
    var f1 = Option<(ArrayList<Int64>)->ArrayList<Int64>>.Some(func1)
    var f2 = Option<(ArrayList<Int64>)->ArrayList<Int64>>.None
    var f3 = Option<(Array<Int64>)->Array<Int64>>.Some(func2)
    var f4 = Option<(Array<Int64>)->Array<Int64>>.None
    var f5 = Some(func3<Int64>)

    var b1 = ArrayList<Int64>([1,2,3])
    var r1 = f1?(b1)
    var r2 = f2?(b1)
    var r3 = f3?([1,2])
    var r4 = f5?(0)
    0
}
