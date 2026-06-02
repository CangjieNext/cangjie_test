/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a24_01

  @Level:         1
  @Assertion:   A.2.5(24) 
                macroExpression
                    : AT Identifier macroAttrExpr? NL* (macroInputExprWithoutParens | macroInputExprWithParens)
                    ;

                macroAttrExpr
                    : LSQUARE NL* quoteToken* NL* RSQUARE
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
                    : LPAREN NL* macroTokens NL* RPAREN
                    ;
                macroTokens
                    : (quoteToken | macroExpression)*
                    ;

  @Description: Check trivial macro expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_macros_01.cj
*/

import aux_macros_01.*
import std.ast.*

main() {
    var a = @Identity(2 + 2)

    var v1 = 2
    var v2:Int64 = 2 
    var t:Tokens = quote($(v1 + v2))
    var unused = @Identity(t)

    return 0
}
