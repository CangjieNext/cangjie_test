/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a01_03

  @Level:         1

  @Assertion:    14.2.2(1)  Macro invocation expressions comply with the following syntax rules:
                  macroExpression
                      : '@' identifier macroAttrExpr?
                      (macroInputExprWithoutParens | macroInputExprWithParens)
                      ;
                  macroAttrExpr
                      : '[' quoteToken* ']'
                      ;
                  macroInputExprWithoutParens
                      : functionDefinition
                      | operatorFunctionDefinition
                      | staticInit
                      | structDefinition
                      | structPrimaryInit
                      | structInit
                      | enumDefinition
                      | caseBody
                      | classDefinition
                      | classPrimaryInit
                      | classInit
                      | interfaceDefinition
                      | variableDeclaration
                      | propertyDefinition
                      | extendDefinition
                      | macroExpression
                      ;
                  macroInputExprWithParens
                      : '(' macroTokens ')'
                      ;
                  macroTokens 
                      : (quoteToken | macroExpression)*
                      ;
 
  @Description:  Check that the macroInputExprWithoutParens can not be assignment operation
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj
*/

import std.ast.*
import aux_macros.*

main(): Unit {
    var a = 3

    @stub
    a += 5
}
