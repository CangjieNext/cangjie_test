/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10

func test(){
    var a = true && if({top_a++; true}()){
        true
    } else {
        top_a; 
        true
    }

    var b = true ||  if({top_a++; true}()){true} else {top_a; true}
    var c = Option<Int64>.Some(100) ??  if({top_a++; true}()){1} else {top_a; 2}

    var c1 = Option<Int32>.Some(100) ??  if({top_a++; true}()){1} else {top_a; 1}
    var c2 = Option<Float64>.Some(100.0) ??  if({top_a++; true}()){1.0} else {top_a; 1.0}
    var c3 = Option<Unit>.Some(()) ??  if({top_a++; true}()){()} else {top_a; ()}
    var c4 = Option<String>.Some("100") ??  if({top_a++; true}()){"true"} else {top_a; "true"}
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ??  if({top_a++; true}()){(10.0, "")} else {top_a; (10.0, "")}
    var c6 = Option<Array<String>>.Some([""]) ??  if({top_a++; true}()){["diugvcdgs"]} else {top_a; [""]}

    let d = true &&  if({top_a++; true}()){true} else {top_a; true}
    let e = true ||  if({top_a++; true}()){true} else {top_a; true}
    let f = Option<Int64>.Some(100) ??  if({top_a++; true}()){3} else {top_a; 1}
}

main(){

}



