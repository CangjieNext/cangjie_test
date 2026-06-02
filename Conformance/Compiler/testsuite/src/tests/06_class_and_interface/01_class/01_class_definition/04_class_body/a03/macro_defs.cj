/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The syntax of a class body is as the following:
              classBody
                : '{'
                  classMemberDeclaration*
                  classPrimaryInit?
                  classMemberDeclaration*
                  '}'
                ;
              classMemberDeclaration
                : classInit
                | staticInit
                | variableDeclaration
                | functionDefinition
                | operatorFunctionDefinition
                | macroExpression
                | propertyDefinition
                ;

  @Description: Macro definitions for the tests

  @MacroLib

  @Structure: complex-aux
*/

macro package a03

import std.ast.*

public macro macro_f(attr: Tokens, val: Tokens) {
  quote(func $attr() {return $val})
}

public macro macro_v(attr: Tokens, val: Tokens) {
  quote(var $attr = $val)
}

public macro macro_l(attr: Tokens, val: Tokens) {
  quote(let $attr = $val)
}