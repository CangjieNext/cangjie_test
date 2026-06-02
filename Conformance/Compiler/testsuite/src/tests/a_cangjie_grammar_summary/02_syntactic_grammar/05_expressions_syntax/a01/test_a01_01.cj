/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a01_01

  @Level:         1
  @Assertion:   A.2.5(1)
                expression
                    : assignmentExpression
                    ;
                assignmentExpression
                    : leftValueExpressionWithoutWildCard NL* assignmentOperator NL* flowExpression
                    | leftValueExpression NL* ASSIGN NL* flowExpression
                    | tupleLeftValueExpression NL* ASSIGN NL* flowExpression
                    | flowExpression
                    ;
                tupleLeftValueExpression
                    : LPAREN NL* (leftValueExpression | tupleLeftValueExpression) 
                    (NL* COMMA NL* (leftValueExpression | tupleLeftValueExpression))+ NL* COMMA? NL* RPAREN ;
                leftValueExpression
                    : leftValueExpressionWithoutWildCard
                    | WILDCARD
                    ;
                leftValueExpressionWithoutWildCard
                    : identifier
                    | leftAuxExpression QUEST? NL* assignableSuffix
                    ;
                leftAuxExpression
                    : identifier (NL* typeArguments)?
                    | type
                    | thisSuperExpression
                    | leftAuxExpression QUEST? NL* DOT NL* identifier (NL* typeArguments)?
                    | leftAuxExpression QUEST? callSuffix
                    | leftAuxExpression QUEST? indexAccess
                    ;


  @Description: Check various assignment expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
public let l1 = 12 + 3
public let l2: Int8 = 1 - 0
public let l3 = (0x3, 'A')

public var v1 = 0.12 * 3.0
public var v2: ?Int16 = -20
public var (v3_1, v3_2) = (0b1001, "BBB")

let l4 = 0
let l5: Int64 = 0
let l6 = (0, 1..10)

var v4 = 0.0/0.0
var v5: Int64 = 0
var (v6_1, _) = (0, [1,2,3])

func my() {}

var foo: ()-> Unit = my

main() {
    var v7 = my()
    let l7 = [1,2,3,4]
    var v8 = l7[1]

    return 0
}