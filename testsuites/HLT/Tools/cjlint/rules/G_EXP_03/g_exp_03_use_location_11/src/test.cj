/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A{
    public static var var_a = 1
    
    public func foo_a(){
        var_a++
    }

    public func foo_a(a:Int64){
        var_a
        a
    }
}



struct B{
    public var a = true && try{A().foo_a(); true}catch(_){true}
    public var b = true ||  try{A().foo_a(); true}catch(_){true}
    public var c = Option<Int64>.Some(100) ??  try{A().foo_a(); 1}catch(_){1} 

    public var c1 = Option<Int32>.Some(100) ?? try{A().foo_a(); 1}catch(_){1}
    public var c2 = Option<Float64>.Some(100.0) ??  try{A().foo_a(); 1.0}catch(_){1.0}
    public var c3 = Option<Unit>.Some(()) ?? try{A().foo_a(); ()}catch(_){()}
    public var c4 = Option<String>.Some("100") ??   try{A().foo_a(); "true"}catch(_){"true"}
    public var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? try{A().foo_a(); (10.0, "")}catch(_){(10.0, "")}
    public var c6 = Option<Array<String>>.Some([""]) ?? try{A().foo_a(); [""]}catch(_){[""]}

    public let d = true && try{A().foo_a(); true}catch(_){true}
    public let e = true || try{A().foo_a(); true}catch(_){true}
    public let f = Option<Int64>.Some(100) ?? try{A().foo_a(); 1}catch(_){1} 
}

main(){

}



