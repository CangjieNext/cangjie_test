/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10

func test(){
    var a = true && top_a++ is Unit

    var b = true ||  top_a++ is Unit
    var c = Option<Int64>.Some(100) ??  { top_a++ is Unit; top_a } () 

    var c1 = Option<Int32>.Some(100) ??  {top_a++ is Unit; Int32(1)}()
    var c2 = Option<Float64>.Some(100.0) ??  {top_a++ is Unit; 1.0}()
    var c3 = Option<Unit>.Some(()) ?? {top_a++ is Unit; () }()
    var c4 = Option<String>.Some("100") ??   {top_a++ is Unit; "true"}()
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? {top_a++ is Unit; (10.0, "")}()
    var c6 = Option<Array<String>>.Some([""]) ?? {top_a++ is Unit; [""]}()

    let d = true && top_a++ is Unit
    let e = true || top_a++ is Unit
    let f = Option<Int64>.Some(100) ?? { top_a++ is Unit; top_a } ()
}

main(){

}



