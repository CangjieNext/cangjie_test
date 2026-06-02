// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package view

internal import std.ast.*

public macro callView(input: Tokens): Tokens {
    input
}

public macro callView2(input: Tokens): Tokens {
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    input
}

public macro initFunc(input: Tokens): Tokens {
    return quote(
        init(name: Int64){
            counter = name
            print("Init init")
        }
    )
}

public macro initFunc2(input: Tokens): Tokens {
    return quote(
        init(name: Int64, name2: Int64){
            counter = name
            print("Init init")
        }
    )
}

public macro PriFunc(input: Tokens): Tokens {
    return quote(
        t(name: Int64){
            counter = name
            print("Primary primary")
        }
    )
}

public macro M(input: Tokens) {
    input
}

public macro M(attr: Tokens, input: Tokens) {
    input
}
