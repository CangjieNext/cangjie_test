/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a25_01

  @Level:         1
  @Assertion:   A.2.5(25) 
                assignmentOperator
                    : ASSIGN
                    | ADD_ASSIGN
                    | SUB_ASSIGN
                    | EXP_ASSIGN
                    | MUL_ASSIGN
                    | DIV_ASSIGN
                    | MOD_ASSIGN
                    | AND_ASSIGN
                    | OR_ASSIGN
                    | BITAND_ASSIGN
                    | BITOR_ASSIGN
                    | BITXOR_ASSIGN
                    | LSHIFT_ASSIGN
                    | RSHIFT_ASSIGN
                    ;
                equalityOperator
                    : NOTEQUAL
                    | EQUAL
                    ;
                comparisonOperator
                    : LT
                    | GT
                    | LE
                    | GE
                    ;
                shiftingOperator
                    : LSHIFT | RSHIFT
                    ;
                flowOperator
                    : PIPELINE | COMPOSITION
                    ;
                additiveOperator
                    : ADD | SUB
                    ;
                exponentOperator
                    : EXP
                    ;
                multiplicativeOperator
                    : MUL
                    | DIV
                    | MOD
                    ;
                prefixUnaryOperator
                    : SUB
                    | NOT
                    ;
                overloadedOperators
                    : LSQUARE RSQUARE
                    | INC
                    | DEC
                    | NOT
                    | ADD
                    | SUB
                    | EXP
                    | MUL
                    | DIV
                    | MOD
                    | LSHIFT
                    | RSHIFT
                    | LT
                    | GT
                    | LE
                    | GE
                    | EQUAL
                    | NOTEQUAL
                    | BITAND
                    | BITXOR
                    | BITOR
                    | AND
                    | OR
                    ;

  @Description: Check some operators.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/
func addOne(v:Int64) {
    return v + 1
}
main() {
    var v = 1
    //assignmentOperator
    v += 1
    //equalityOperator
    v == 2
    //comparisonOperator
    v<4
    //shiftingOperator
    v>>2
    //flowOperator
    v |> addOne
    //additiveOperator
    v + 1
    //exponentOperator
    v ** 2
    //multiplicativeOperator
    v * 3
    //prefixUnaryOperator
    -v
    //overloadedOperators
    [v, v + 1]

    return 0
}
