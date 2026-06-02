/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a05_02

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
  @Comment:     Checks spreadElement in array literals
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
  @Issue:       6548
*/

main() {
    // spreadElement是dev的语法，目前的实现是0.22的spec,无此语法
    // [1, *2]
    return 0
}
