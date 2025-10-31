/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test(){
    var a = true && false
    var b = true || false
    var c = Option<Int64>.Some(100) ?? 1
    var c1 = Option<Int32>.Some(100) ?? 1
    var c2 = Option<Float64>.Some(100.0) ?? 1.0
    var c3 = Option<Unit>.Some(()) ?? ()
    var c4 = Option<String>.Some("100") ?? """
hihi"""
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? (1.0, "")
    var c6 = Option<Array<String>>.Some([""]) ?? [""]

    let d = true && false
    let e = true || false
    let f = Option<Int64>.Some(100) ?? 1
}

main(){

}



