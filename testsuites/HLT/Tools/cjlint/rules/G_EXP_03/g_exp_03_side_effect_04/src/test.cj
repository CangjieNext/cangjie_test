/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.*

var fs: File = File("./b/b_file_write.txt", Write)

func write(){
    fs.write(Array<UInt8>(10, {i => 1}))
}

func test(){
    var a = true && try{write(); true}catch(_){true}
    var b = true ||  try{write(); true}catch(_){true}
    var c = Option<Int64>.Some(100) ??  try{write(); 1}catch(_){1} 

    var c1 = Option<Int32>.Some(100) ?? try{write(); 1}catch(_){1}
    var c2 = Option<Float64>.Some(100.0) ??  try{write(); 1.0}catch(_){1.0}
    var c3 = Option<Unit>.Some(()) ?? try{write(); ()}catch(_){()}
    var c4 = Option<String>.Some("100") ??   try{write(); "true"}catch(_){"true"}
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? try{write(); (10.0, "")}catch(_){(10.0, "")}
    var c6 = Option<Array<String>>.Some([""]) ?? try{write(); [""]}catch(_){[""]}

    let d = true && try{write(); true}catch(_){true}
    let e = true || try{write(); true}catch(_){true}
    let f = Option<Int64>.Some(100) ?? try{write(); 1}catch(_){1} 
}

main(){
    fs.close()
}



