var top_a = 10

let TUPLE = (1, 2, 3)
let T1 = Option<(Int64,Int64,Int64)>.Some(TUPLE)
let T2 = Option<(Int64,Int64,Int64)>.None
let R7 = T1?[0] // R7 = Option<Int64>.Some(1)
let R8 = T2?[0] // R8 = Option<Int64>.None

class C {
var item: Int64 = 0
}
let C0 = C()
let TOPC1 = Option<C>.Some(C0)
let C2 = Option<C>.None
let R1 = TOPC1?.item // R1 = Option<Int64>.Some(100)
let R2 = C2?.item // R2 = Option<Int64>.None

class A{

    public func test(){
        var a = true && [true][{=> TOPC1?.item; 0}()]

        var b = true || [true][{=> TOPC1?.item; 0}()]

        var C0 = Option<Int64>.Some(100) ?? [100][{=> TOPC1?.item; 0}()]

        var c1 = Option<Int32>.Some(100) ?? [Int32(100)][{=> TOPC1?.item; 0}()]

        var C2 = Option<Float64>.Some(100.0) ?? [100.0][{=> TOPC1?.item; 0}()]

        var c3 = Option<Unit>.Some(()) ?? [()][{=> TOPC1?.item; 0}()]

        var c4 = Option<String>.Some("100") ?? ["true"][{=> TOPC1?.item; 0}()]

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? [(10.0, "")][{=> TOPC1?.item; 0}()]

        var c6 = Option<Array<String>>.Some([""]) ?? [[""]][{=> TOPC1?.item; 0}()]

        let d = true && [true][{=> TOPC1?.item; 0}()]

        let e = true || [true][{=> TOPC1?.item; 0}()]

        let f = Option<Int64>.Some(100) ?? [100][{=> TOPC1?.item; 0}()]

        let g = Option<Int64>.Some((1)) ?? [1][{=> TOPC1?.item; 0}()]

    }
}

main(){

}


/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
