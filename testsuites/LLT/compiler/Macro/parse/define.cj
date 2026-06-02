// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

public macro var_expr(input: Tokens) {
    input + quote(
    b = 2)
}

public macro expr_decl(input: Tokens) {
    input + quote(
    var b = 2)
}

public macro decl(input: Tokens) {
    quote(var b = 2)
}

public macro Two(input: Tokens) {
    input + quote(; 2)
}

public macro TwoExpr(input: Tokens) {
    input + quote(; b > 2)
}

public macro M1(input: Tokens) {
    quote($(parseDecl(input)))
}

public macro M2(input: Tokens) {
    quote($(parseExpr(input)))
}

public macro AA3(attr: Tokens, input: Tokens) {
    quote($attr;$input)
}

public macro Same(input: Tokens) {
    return input
}

public macro Same(attr: Tokens, input: Tokens) {
    return input
}

public macro X(attr: Tokens, input: Tokens): Tokens {
    return quote(@X[0] {i:Int64=>i}) // lambda
}

public macro Operator(input: Tokens) {
    let classDecl: ClassDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let classBody = classDecl.body.decls
    var newBody = Tokens()
    for (decl in classBody) {
        if (decl is FuncDecl) {
            let funcdecl = (decl as FuncDecl).getOrThrow()
            let modifiers = funcdecl.modifiers
            let keyword = funcdecl.keyword
            // for operator function, the identifier is actually a keyword
            let name = funcdecl.identifier
            if (name.value == "init") {
                newBody.append(quote($decl))
            } else {
                newBody.append(
                    quote(
                    $modifiers $keyword $name ($(funcdecl.funcParams))
                    $(funcdecl.block)
                ))
            }
        } else {
            newBody.append(quote($decl)).append(Token(TokenKind.NL))
        }
    }
    let classModifiers = classDecl.modifiers
    let classKeyword: Token = classDecl.keyword
    let classIdentifier: Token = classDecl.identifier
    quote(
        $classModifiers $classKeyword $classIdentifier {
            $newBody
        }
    )
}

public macro toFloat32(x: Tokens) {
    quote(Float32(@x))
}

public macro Mdiag(input: Tokens) {
    return quote(
        class B {
  let data = "aaa"
  let key = "class B"
  func test(){
    let errors: ArrayList<String> = ArrayList<String>()
    if (true) {
      errors.add(
        "Sum of children pools' alloc fraction should be less than 1 got: ${data}"
                                + " for pool: ${key}"
      )
      println(errors)
    }
  }
})
}
