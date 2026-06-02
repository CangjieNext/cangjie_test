/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a02_01

  @Level:         1
  @Assertion:   A.2.5(2)
                flowExpression
                    : coalescingExpression (NL* flowOperator NL* coalescingExpression)*
                    ;
                coalescingExpression
                    : logicDisjunctionExpression (NL* QUEST QUEST NL* logicDisjunctionExpression)*
                    ;
                logicDisjunctionExpression
                    : logicConjunctionExpression (NL* OR NL* logicConjunctionExpression)*
                    ;
                logicConjunctionExpression
                    : rangeExpression (NL* AND NL* rangeExpression)*
                    ;
                rangeExpression
                    : bitwiseDisjunctionExpression NL* (CLOSEDRANGEOP | RANGEOP) NL*
                     bitwiseDisjunctionExpression (NL* COLON NL* bitwiseDisjunctionExpression)?
                    | bitwiseDisjunctionExpression
                    ;
                bitwiseDisjunctionExpression
                    : bitwiseXorExpression (NL* BITOR NL* bitwiseXorExpression)*
                    ;
                bitwiseXorExpression
                    : bitwiseConjunctionExpression (NL* BITXOR NL* bitwiseConjunctionExpression)*
                    ;
                bitwiseConjunctionExpression
                    : equalityComparisonExpression (NL* BITAND NL* equalityComparisonExpression)*
                    ;
                equalityComparisonExpression
                    : comparisonOrTypeExpression (NL* equalityOperator NL* comparisonOrTypeExpression)?
                    ;
                comparisonOrTypeExpression
                    : shiftingExpression (NL* comparisonOperator NL* shiftingExpression)?
                    | shiftingExpression (NL* IS NL* type)?
                    | shiftingExpression (NL* AS NL* type)?
                    ;
                shiftingExpression
                    : additiveExpression (NL* shiftingOperator NL* additiveExpression)*
                    ;
                additiveExpression
                    : multiplicativeExpression (NL* additiveOperator NL* multiplicativeExpression)*
                    ;
                multiplicativeExpression
                    : exponentExpression (NL* multiplicativeOperator NL* exponentExpression)*
                    ;
                exponentExpression
                    : prefixUnaryExpression (NL* exponentOperator NL* prefixUnaryExpression)*
                    ;
                prefixUnaryExpression
                    : prefixUnaryOperator* incAndDecExpression
                    ;
                incAndDecExpression
                    : postfixExpression (INC | DEC )?
                    ;
                postfixExpression
                    : atomicExpression
                    | type NL* DOT NL* identifier
                    | postfixExpression NL* DOT NL* identifier (NL* typeArguments)?
                    | postfixExpression callSuffix
                    | postfixExpression indexAccess
                    | postfixExpression NL* DOT NL* identifier callSuffix? trailingLambdaExpression
                    | identifier callSuffix? trailingLambdaExpression
                    | postfixExpression (QUEST questSeperatedItems)+
                    ;
                questSeperatedItems
                    : questSeperatedItem+
                    ;
                questSeperatedItem
                    : itemAfterQuest (callSuffix | callSuffix? trailingLambdaExpression | indexAccess)?
                    ;
                itemAfterQuest
                    : DOT identifier (NL* typeArguments)?
                    | callSuffix
                    | indexAccess
                    | trailingLambdaExpression
                    ;
                callSuffix
                    : LPAREN NL* (valueArgument (NL* COMMA NL* valueArgument)* NL*)? RPAREN
                    ;
                valueArgument
                    : identifier NL* COLON NL* expression
                    | expression
                    | refTransferExpression
                    ;
                refTransferExpression
                    : INOUT (expression DOT)? identifier
                    ;
                indexAccess
                    : LSQUARE NL* (expression | rangeElement) NL* RSQUARE
                    ;
                rangeElement
                    : RANGEOP
                    | ( CLOSEDRANGEOP | RANGEOP ) NL* expression
                    | expression NL* RANGEOP
                    ;

  @Description: Check various expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
func a(s : String) { s + 'a' }

func b(s : String) { s + 'b' }

class C {
    var v = 442
    public func foo() {}
}

main() {
    // flowExpression
    "c" |> (a ~> b)
    // coalescingExpression
    var c1: Int64 = 1
    var c2 = Option<Int64>.None
    var c3 = c2 ?? c1
    // logicDisjunctionExpression and logicConjunctionExpression
    false || true && true
    // rangeExpression
    // 操作符优先级低于>>非法
    0 * 1 .. 3 + 3:1 + 1
    2 / 1 .. 7 - 3:2 - 1
    // bitwiseDisjunctionExpression
    123 | 321
    // bitwiseXorExpression
    321 ^ 123
    // bitwiseConjunctionExpression
    123 & 321
    // equalityComparisonExpression
    123 == 321
    123 != 321
    // comparisonOrTypeExpression
    123 is Int64
    123.1 as Float64
    // shiftingExpression
    123 >> 2
    123 << 2
    // additiveExpression
    let unused = 2 + 2
    let unused1 = 2 - 3
    // multiplicativeExpression
    let unused2 = 2 * 2
    let unused3 = 2 / 3
    // exponentExpression
    let unused4 = 2 ** 2
    // prefixUnaryExpression
    let unused5 = -2
    !true
    // incAndDecExpression
    var idx = 3
    idx++
    idx--
    // postfixExpression
    a("c")
    C().v
    C().foo()
    var arr = [1,2,3]
    arr[2]

    return 0
}