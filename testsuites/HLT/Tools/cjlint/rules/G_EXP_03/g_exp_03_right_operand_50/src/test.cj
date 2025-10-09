var top_a = 10

func test(){
    var a = true && {
        top_a += 3;
        true
    }()

    var b = true ||  {top_a += 3; true}()
    var c = Option<Int64>.Some(100) ??  {top_a += 3; 2}()

    var c1 = Option<Int32>.Some(100) ??  {top_a += 3; Int32(1)}()
    var c2 = Option<Float64>.Some(100.0) ??  {top_a += 3; 1.0}()
    var c3 = Option<Unit>.Some(()) ?? {top_a += 3}()
    var c4 = Option<String>.Some("100") ??   {top_a += 3; "true"}()
    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? {top_a += 3; (10.0, "")}()
    var c6 = Option<Array<String>>.Some(Array<String>()) ?? {top_a += 3; Array<String>()}()

    let d = true && {top_a += 3; true}()
    let e = true || {top_a += 3; true}()
    let f = Option<Int64>.Some(100) ?? {top_a += 3; 0}()
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
