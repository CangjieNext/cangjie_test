


class B { 
    var c = 0 
    
    init(x: Int64, pteTets!: Int64 = 12) { 
        this.c = x 
    } 
} 

class A { 
    var b: Option < B >= Some(B(1)) 
} 

var t =(Some(B(1)), 300) 

var f = { i: Int64 => Some(B(1)) } 

var g = { i:(Int64) -> Int64 => Some(B(i(2))) } 

main() { 
    
    var oa = Some(A()) 
    
    var ob = Some(t) 
    
    var oc = Some(f) 
    
    var od = Some(g) 
    if(!(oa?.b?.c is Option < Int64 > && ob?[0]?.c is Option < Int64 > && oc?(0)?.c is Option < Int64 > && od?{ i: Int64 => i - 1 }?.c is Option < Int64 >)) { 
        return 1 
    } 
    return 0 
} 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
