var top_a = 10

func test(){
    var a = true && { top_a = 7 ; true}()

    var b = true ||  { top_a = 7 ; true}()
    var c = Option<Int64>.Some(100) ??  { top_a = 7; top_a } () 

    var c1 = Option<Int32>.Some(100) ??  {top_a = 7; Int32(1)}()
    var c2 = Option<Float64>.Some(100.0) ??  {top_a = 7; 1.0}()
    var c3 = Option<Unit>.Some(()) ?? {top_a = 7; () }()
    var c4 = Option<String>.Some("100") ??   {top_a = 7; "true"}()
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? {top_a = 7; (10.0, "")}()
    var c6 = Option<Array<String>>.Some([""]) ?? {top_a = 7; [""]}()

    let d = true && { top_a = 7 ; true}()
    let e = true || { top_a = 7 ; true}()
    let f = Option<Int64>.Some(100) ?? { top_a = 7; top_a } ()
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
