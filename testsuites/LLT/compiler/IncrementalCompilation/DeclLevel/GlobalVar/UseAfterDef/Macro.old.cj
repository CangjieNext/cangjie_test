macro package p1
import std.ast.*

let cnt = 1
public macro foo(a: Tokens) {
    var b = a 
    for (i in 0..cnt){
        println(i)
    }
    return b
}

public macro self(a: Tokens) {
    println(a+a)
    a
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
