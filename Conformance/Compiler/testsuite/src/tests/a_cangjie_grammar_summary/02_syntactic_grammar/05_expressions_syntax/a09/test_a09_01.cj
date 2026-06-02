/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a09_01

  @Level:         1
  @Assertion:   A.2.5(9)
    matchExpression
        : MATCH NL* LPAREN NL* expression NL* RPAREN NL* LCURL NL* matchCase+ NL* RCURL
        | MATCH NL* LCURL NL* (CASE NL* (expression | WILDCARD) NL* DOUBLE_ARROW NL*
         expressionOrDeclaration (end+ expressionOrDeclaration?)*)+ NL* RCURL
        ;
    matchCase
        : CASE NL* pattern NL* patternGuard? NL* DOUBLE_ARROW NL* expressionOrDeclaration
         (end+ expressionOrDeclaration?)*
        ;
    patternGuard
        : WHERE NL* expression
        ;
    pattern
        : constantPattern
        | wildcardPattern
        | varBindingPattern
        | tuplePattern
        | typePattern
        | enumPattern
        ;
    constantPattern
        : literalConstant NL* ( NL* BITOR NL* literalConstant)*
        ;
    wildcardPattern
        : WILDCARD
        ;
    varBindingPattern
        : identifier
        ;

    tuplePattern
        : LPAREN NL* pattern (NL* COMMA NL* pattern)+ NL* RPAREN
        ;
    typePattern
        : (WILDCARD | identifier) NL* COLON NL* type
        ;
    enumPattern
        : NL* ((userType NL* DOT NL*)? identifier enumPatternParameters?)
         (NL* BITOR NL* ((userType NL* DOT NL*)? identifier enumPatternParameters?))*
        ;
    enumPatternParameters
        : LPAREN NL* pattern (NL* COMMA NL* pattern)* NL* RPAREN
        ;


  @Description: Check trivial match expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    var e = 1
    var e2 = 2

    var m1 = match (e) {
        case 0 => 2 + 2
        case _ => 2 - 2
    }

    var m2 = match {
        case e >= 0 => 'a'
        case e <= 0 => 'b'
        case _ => 'x'
    }

    var m3 = match {
        case e >= 0 => match (e2) {
            case 1 | 2 => "succeed"
            case _ => "fail"
        }
        case e <= 0 => match {
            case e2 >= 1 => "fail"
            case _ => "succeed"
        }
        case _ => "fail"
    }

    return 0
}
