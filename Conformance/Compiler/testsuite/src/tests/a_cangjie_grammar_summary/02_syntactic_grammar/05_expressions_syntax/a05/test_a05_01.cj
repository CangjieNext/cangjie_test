/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a05_01

  @Level:         1
  @Assertion:   A.2.5(5)
                collectionLiteral
                    : arrayLiteral
                    ;
                arrayLiteral
                    : LSQUARE (NL* elements)? NL* RSQUARE
                    ;
                elements
                    : element ( NL* COMMA NL* element )*
                    ;
                element
                    : expressionElement
                    | spreadElement
                    ;
                expressionElement
                    : expression
                    ;
                spreadElement
                    : MUL expression
                    ;

  @Description: Check some collection literals.
                Reference to other tests in additional_tests.txt.
  @Comment:     Checks without using of spreadElement
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
func foo() {
    321
}
main() {
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    ['a', 'b', 'c']
    [true, false, false, true]
    ["ab", "bc", "cd", "de"]
    [0x23.2p1, 1.2, 3.21e5, 0.2 / 0.3, 0.0 / 0.0]
    [1..3, 2..4, 3..=6]
    [[1, 2],[3, 4]]
    [foo, { => 42}]
    ['c', if ({=> false}()) { 'b' } else { 'a' }]
    ["Whaaat?", if ({=> true}()) { "Doesn't matter" } else { "Be happy" }]
    var e = 1
    [e, match (e) {
        case 0 => 2 + 2
        case _ => 2 - 2
    }]
    return 0
}
