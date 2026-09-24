/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro    package  define

import   std.ast.*

public  macro  dprint(input: Tokens):Tokens{
    let inputStr=input.toString()
    let result=quote(
        print($(inputStr) + " = ")
        println($(input)))
    return result
}

public   macro testDef(input: Tokens): Tokens {
    println( "I'm in macro body" )
    return input
}

public  macro  ModifyFunc(input: Tokens): Tokens {
    let funcDecl = FuncDecl(input)
    return quote(
        func $(funcDecl.identifier)(id: Int64) {
            println("start ${id}")
            $(funcDecl.block.nodes)
            println("end")
        })
}

public   macro  Foo(attrTokens: Tokens,inputTokens: Tokens):Tokens{
    return   attrTokens+inputTokens
}

public macro Bar(input: Tokens): Tokens {
    return input
}
