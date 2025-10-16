/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test(){
    var var_right1 = false
    var var_right2 = 1
    var var_right3 = 1.0
    let var_right4 = ()
    let var_right5 = ""
    let var_right6 = (1.0, "")
    let var_right7 = [""]
    var var_right8 : Int32 = 1


    var a = true && var_right1
    var b = true || var_right1
    var c = Option<Int64>.Some(100) ?? var_right2

    var c1 = Option<Int32>.Some(100) ?? var_right8
    var c2 = Option<Float64>.Some(100.0) ?? var_right3
    var c3 = Option<Unit>.Some(()) ?? var_right4
    var c4 = Option<String>.Some("100") ?? var_right5
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? var_right6
    var c6 = Option<Array<String>>.Some([""]) ?? var_right7

    let d = true && var_right1
    let e = true || var_right1
    let f = Option<Int64>.Some(100) ?? var_right2
}

main(){

}



