/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros
import std.ast.*

public macro stub(x: Tokens) {
    Tokens()
}

public macro stub(x: Tokens, y: Tokens) {
    Tokens()
}

public macro compile(token: Tokens) {
    token
}

public macro compile(attr: Tokens, input: Tokens) {
    attr + Token(NL) +  input
}

public macro PI(ty: Tokens) {
    quote($ty(3.1415))
}

public macro letDecl (name: Tokens) {
    quote(let $name = "letDecl")
}

public macro letDecl (name: Tokens, value: Tokens) {
    quote(let $name = $value)
}

public macro funcDecl (name: Tokens) {
    quote(func $name() {})
}

public macro funcDecl (name: Tokens, body: Tokens) {
    quote(func $name() { $body })
}

public macro funcWrap (input: Tokens) {
    quote(func wrapped() { $input })
}

public macro funcWrap (name: Tokens, input: Tokens) {
    quote(func $name() { $input })
}

public macro classWrap (name: Tokens, input: Tokens) {
    quote(public class $name { $input })
}

public macro startClassWrap (modif: Tokens, name: Tokens) {
    quote($modif class $name {) + Token(NL)
}

public macro endClassWrap (input: Tokens) {
    quote(}) + Token(NL)
}

public macro addModif(modif: Tokens, input: Tokens) {
    quote($modif $input)
}

public macro addWildcard(input: Tokens) {
    quote($input
    case _ => ())
}

