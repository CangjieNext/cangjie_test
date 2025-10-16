/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
macro package annotation_macro

import std.ast.*

public macro CheckAnnotations(input: Tokens): Tokens {
    let funcDecl = FuncDecl(input)
    let annos = funcDecl.funcParams[0]
    let names = funcDecl.funcParams[1]

    let nodes = ArrayList<Node>()

    nodes.add(
        parseDecl(quote(
        let annoNames = ArrayList<String>($(annos.identifier).size) {
            idx => $(annos.identifier)[idx].toString()
        }
        ))
    )

    nodes.add(parseExpr(
        quote(
            for (anno in annoNames) {
                @Assert(names.contains(anno))
            }
        ))
    )
    nodes.add(parseExpr(
        quote(
            for (name in names) {
                @Assert(annoNames.contains(name))
            }
        ))
    )

    nodes.add(all: funcDecl.block.nodes)
    funcDecl.block.nodes = nodes

    funcDecl.toTokens()
}

public macro CheckAynamicAnnotations(input: Tokens): Tokens {
    let funcDecl = FuncDecl(input)
    let annos = funcDecl.funcParams[0]
    let names = funcDecl.funcParams[1]
    let ti = funcDecl.funcParams[2]

    let nodes = ArrayList<Node>()

    nodes.add(
        parseDecl(quote(
        let annoNames = ArrayList<String>($(annos.identifier).size) {
            idx => $(annos.identifier)[idx].toString()
        }
        ))
    )

    nodes.add(parseExpr(
        quote(
            for (anno in annoNames) {
                @Assert(names.contains(anno))
            }
        ))
    )
    nodes.add(parseExpr(
        quote(
            for (name in names) {
                @Assert(annoNames.contains(name))
            }
        ))
    )

    nodes.add(all: funcDecl.block.nodes)
    funcDecl.block.nodes = nodes

    funcDecl.toTokens()
}

public macro CountAnnotations(setting: Tokens, input: Tokens): Tokens {
    if (setting[0].value != 'earlyBreak') {
        return input
    }

    let decl = FuncDecl(input)
    let ti = decl.genericParam.parameters.get(0)
    let nodes = ArrayList<Node>()
    nodes.add(VarDecl(quote(
        var count = 0
    )))

    let expr = parseExpr(
        quote(
        for (each in $(decl.funcParams[0].identifier) where each is $(ti)) {
            if ($(setting[2])) {
                break
            }
            count += 1     
        }
    )
    )
    nodes.add(expr)
    nodes.add(all: decl.block.nodes)
    nodes.add(parseExpr(
        quote(
            return count
        )
    ))


    decl.block.nodes = nodes

    decl.toTokens()
}

public macro CountDynamicAnnotations(input: Tokens): Tokens {
    let decl = FuncDecl(input)

    let nodes = ArrayList<Node>()
    nodes.add(VarDecl(quote(
        var count = 0
    )))

    let expr = parseExpr(
        quote(
        for (each in $(decl.funcParams[0].identifier) where TypeInfo.of(each).isSubtypeOf($(decl.funcParams[1].identifier))) {
            count += 1     
        }
    )
    )
    nodes.add(expr)
    nodes.add(all: decl.block.nodes)
    nodes.add(parseExpr(
        quote(
            return count
        )
    ))

    decl.block.nodes = nodes

    decl.toTokens()
}

public macro ConstructAnnotation(input: Tokens): Tokens {
    let classDecl = ClassDecl(input)
    let ctor = quote(
        $(classDecl.identifier)(let name: String) {
        }
    )
    let funcDecl = parseDecl(ctor, astKind: "PrimaryCtorDecl")
    funcDecl.modifiers.add(Modifier(Token(CONST)))

    let toStringFunc = quote(
        public func toString() {this.name}
    )
    let toStringDecl = parseDecl(toStringFunc)
    classDecl.body.decls.add(funcDecl)
    classDecl.body.decls.add(toStringDecl)
    classDecl.superTypes.add(parseType(quote(ToString)))
    return quote(
        $(classDecl)
    )
}

public macro AnnotationTest(attr: Tokens, input: Tokens): Tokens {
    var decl: FuncDecl = (parseDecl(input) as FuncDecl).getOrThrow()
    println(decl.identifier.value)
    input
}
