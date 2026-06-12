/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10

class A{

    public func test(){
        var a = true && [true][{=> top_a; 0}()]

        var b = true || [true][{=> top_a; 0}()]

        var c = Option<Int64>.Some(100) ?? [100][{=> top_a; 0}()]

        var c1 = Option<Int32>.Some(100) ?? [Int32(100)][{=> top_a; 0}()]

        var c2 = Option<Float64>.Some(100.0) ?? [100.0][{=> top_a; 0}()]

        var c3 = Option<Unit>.Some(()) ?? [()][{=> top_a; 0}()]

        var c4 = Option<String>.Some("100") ?? ["true"][{=> top_a; 0}()]

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? [(10.0, "")][{=> top_a; 0}()]

        var c6 = Option<Array<String>>.Some([""]) ?? [[""]][{=> top_a; 0}()]

        let d = true && [true][{=> top_a; 0}()]

        let e = true || [true][{=> top_a; 0}()]

        let f = Option<Int64>.Some(100) ?? [100][{=> top_a; 0}()]

        let g = Option<Int64>.Some((1)) ?? [1][{=> top_a; 0}()]

    }
}

main(){

}



