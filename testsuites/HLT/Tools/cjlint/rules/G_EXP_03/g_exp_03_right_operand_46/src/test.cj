/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C {
    public var item = 100
}

    func test(){
        let err = C()
        let a_c2= Option<C>.None

        var a = true && [true][{a_c2?.item = 200; 0}()]

        var b = true || [true][{a_c2?.item = 200; 0}()] 

        var c = Option<Int64>.Some(100) ?? [100][{a_c2?.item = 200; 0}()]

        var c1 = Option<Int32>.Some(100) ?? [Int32(100)][{a_c2?.item = 200; 0}()]

        var c2 = Option<Float64>.Some(100.0) ?? [100.0][{a_c2?.item = 200; 0}()]

        var c3 = Option<Unit>.Some(()) ?? [()][{a_c2?.item = 200; 0}()]

        var c4 = Option<String>.Some("100") ?? ["true"][{a_c2?.item = 200; 0}()]

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? [(10.0, "")][{a_c2?.item = 200; 0}()]

        var c6 = Option<Array<String>>.Some([""]) ?? [[""]][{a_c2?.item = 200; 0}()]

        let d = true && [true][{a_c2?.item = 200; 0}()] 

        let e = true || [true][{a_c2?.item = 200; 0}()]

        let f = Option<Int64>.Some(100) ?? [100][{a_c2?.item = 200; 0}()]

        let g = Option<Int64>.Some((1)) ?? [1][{a_c2?.item = 200; 0}()]
    }

main(){

}


