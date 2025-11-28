/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import std.collection.*

enum E1 {
    XY
    func test1() {
        var a1 = HashSet<Int64>([0,1])
        var a2 = HashSet<String>(["a0","b1"])
        var a3 = HashMap<String,Int64>([("a0",0),("b1",1)])
        var a4 = HashMap<Int64,Int64>([(1,0)])
        var a5 = ArrayList<Float64>([1.0])
        let v1 = Option<Array<Int64>>.Some([1,2])
        let v2 = Option<Array<Int64>>.None
        let v3 = Option<ArrayList<Float64>>.Some(a5)
        let v4 = Option<ArrayList<Float64>>.None
        let v5 = Option<HashSet<Int64>>.Some(a1)
        let v6 = Option<HashSet<Int64>>.None
        let v7 = Option<HashMap<String,Int64>>.Some(a3)
        let v8 = Option<HashMap<Int64,Int64>>.None
        let r1 = v1 ?? [3,2]
        let r2 = v2 ?? [3,4]
        let r3 = v3 ?? a5
        let r4 = v4 ?? a5
        let r5 = v5 ?? a1
        let r6 = v6 ?? a1
        let r7 = v7 ?? a3 //expr v7 ?? a3
        var r8 = v8 ?? a4
    }
}
main(){
    var m1 = E1.XY.test1()
    0
}