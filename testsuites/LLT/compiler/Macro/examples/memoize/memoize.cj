// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

internal import std.ast.*

func checkBooleanAttr(attr: Tokens): Bool {
    // true or false
    if (attr.size != 1 || attr[0].kind != TokenKind.BOOL_LITERAL) {
        throw IllegalArgumentException("Attribute for memoize should be true or false")
    }
    return attr[0].value == "true"
}

/// memoize is general for (T1) -> T2 function
/// Foo(a: Int32) -> Int32 // ok
/// Foo(a: String) -> Int32 // ok
/// Foo(a: String, b: Int32) -> Int32 // not ok
public macro memoize(attr: Tokens, input: Tokens): Tokens {
    let memoized: Bool = checkBooleanAttr(attr)

    // no memorization
    if (!memoized) {
        return input
    }

    // optimizing with memory
    let fd = (parseDecl(input) as FuncDecl).getOrThrow()
    // Construct HashMap based on the param-type and return type.
    let paramList = fd.funcParams
    let paramType = paramList[0].paramType
    let retType = fd.declType
    let paramArg = paramList[0].identifier
    let funcBody = fd.block.nodes
    var newBody = Tokens()
    let mapName = Token(IDENTIFIER, fd.identifier.value + "MemoMap")
    newBody = newBody + quote(
        if ($(mapName).contains($paramArg)) {
            return $(mapName).get($paramArg).getOrThrow()
        }
    )
    let size = funcBody.size
    for (i in 0..size - 1) {
        newBody = newBody + quote($(funcBody[i])) + Token(NL)
    }
    let retNode = funcBody[size - 1]
    var addMapPut = Tokens()
    var letRet = Tokens()
    if ((retNode is ReturnExpr)) {
        let returnExpr = quote($((retNode as ReturnExpr).getOrThrow().expr))
        letRet = quote(let genRet = $(returnExpr)) + Token(NL)
    } else {
        letRet = quote(let genRet = $(retNode)) + Token(NL)
    }
    addMapPut = quote($(mapName).add($paramArg, genRet)) + Token(NL)
    newBody = newBody + quote($letRet) + addMapPut
    newBody = newBody + quote(return genRet) + Token(NL)

    let ret = quote(
        var $(mapName): HashMap<$(paramType), $(retType)> = HashMap<$(paramType), $(retType)>()

        func $(fd.identifier) ($(paramList)) : $retType {
            $newBody
        }
    )
    return ret
}
