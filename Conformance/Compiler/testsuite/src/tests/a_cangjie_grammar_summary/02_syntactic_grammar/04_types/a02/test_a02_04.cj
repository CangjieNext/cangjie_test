/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a02_04

  @Level:         1
  @Assertion:   A.2.4(2)
                arrowType
                    : arrowParameters NL* ARROW NL* type
                    ;
                arrowParameters
                    : LPAREN NL* (type (NL* COMMA NL* type)* NL*)? RPAREN
                    ;

  @Description: Check arrow type without RPAREN in parameters
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single
*/


main() {
    var v1: (Int8 -> Bool
    return 0
}
