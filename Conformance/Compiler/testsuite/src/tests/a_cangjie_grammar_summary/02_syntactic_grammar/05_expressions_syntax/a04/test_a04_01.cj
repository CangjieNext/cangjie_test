/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a04_01

  @Level:         1
  @Assertion:   A.2.5(4) 
                literalConstant
                    : IntegerLiteral
                    | FloatLiteral
                    | CharacterLiteral
                    | CharacterByteLiteral
                    | booleanLiteral
                    | stringLiteral
                    | ByteStringArrayLiteral
                    | unitLiteral
                    ;
                booleanLiteral
                    : TRUE
                    | FALSE
                    ;
                stringLiteral
                    : lineStringLiteral
                    | multiLineStringLiteral
                    | MultiLineRawStringLiteral
                    ;
                lineStringContent
                    : LineStrText
                    ;
                lineStringLiteral
                    : QUOTE_OPEN (lineStringExpression | lineStringContent)* QUOTE_CLOSE
                    ;
                lineStringExpression
                    : LineStrExprStart SEMI* (expressionOrDeclaration (SEMI+ expressionOrDeclaration?)*) SEMI* RCURL
                    ;
                multiLineStringContent
                    : MultiLineStrText
                    ;
                multiLineStringLiteral
                    : TRIPLE_QUOTE_OPEN (multiLineStringExpression | multiLineStringContent)* TRIPLE_QUOTE_CLOSE
                    ;
                multiLineStringExpression
                    : MultiLineStrExprStart end* (expressionOrDeclaration (end+ expressionOrDeclaration?)*) end* RCURL
                    ;

  @Description: Check boolean literal.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
main() {
    var b: Bool
    b = true
    b = false
    return 0
}
