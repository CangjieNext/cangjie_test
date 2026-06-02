// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package ui

internal import std.ast.*

public macro MComponent(input: Tokens): Tokens {
    if (let cls: ClassDecl <- parseDecl(input)) {
        for (mem in cls.body.decls) {
            if (let method: FuncDecl <- mem && method.identifier.value == "build") {
                let nodes = method.block.nodes
                if (nodes.size > 0 && let call: CallExpr <- nodes[0] && let ref: RefExpr <- call.callFunc && ref.identifier.value == "testCall") {
                    let newArgs = if (call.arguments.size == 0) {
                        quote(x)   
                    } else {
                        quote(x, $call.arguments)
                    }
                    method.block.nodes[0] = CallExpr(quote(
                        $(ref.identifier)($newArgs)
                    ))
                }
            }
        }
        quote(
            $cls
        )
    } else {
        input
    }
}

public macro MState(input: Tokens): Tokens {
    input
}

public macro MLink(input: Tokens): Tokens {
    input
}

public macro MBuilder(input: Tokens): Tokens {
    input
}