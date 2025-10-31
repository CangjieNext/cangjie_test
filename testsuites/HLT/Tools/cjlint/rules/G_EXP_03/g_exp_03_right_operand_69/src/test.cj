/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10

func test(){
    var a = true && try{top_a++; true}catch(_){true}

    var b = true ||  try{top_a++; true}catch(_){true}
    var c = Option<Int64>.Some(100) ??  try{top_a++; 1}catch(_){1} 

    var c1 = Option<Int32>.Some(100) ?? try{top_a++; 1}catch(_){1}
    var c2 = Option<Float64>.Some(100.0) ??  try{top_a++; 1.0}catch(_){1.0}
    var c3 = Option<Unit>.Some(()) ?? try{top_a++; ()}catch(_){()}
    var c4 = Option<String>.Some("100") ??   try{top_a++; "true"}catch(_){"true"}
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? try{top_a++; (10.0, "")}catch(_){(10.0, "")}
    var c6 = Option<Array<String>>.Some([""]) ?? try{top_a++; [""]}catch(_){[""]}

    let d = true && try{top_a++; true}catch(_){true}
    let e = true || try{top_a++; true}catch(_){true}
    let f = Option<Int64>.Some(100) ?? try{top_a++; 1}catch(_){1} 
}

main(){

}



