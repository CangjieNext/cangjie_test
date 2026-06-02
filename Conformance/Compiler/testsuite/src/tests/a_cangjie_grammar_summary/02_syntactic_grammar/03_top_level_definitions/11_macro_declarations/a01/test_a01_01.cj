/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_11_a01_01

  @Level:         1
  @Assertion:   A.2.3.11(1)
                macroDefinition
                    : PUBLIC NL* MACRO NL* identifier NL*
                    (macroWithoutAttrParam | macroWithAttrParam) NL*
                    (COLON NL* identifier NL*)?
                    (ASSIGN NL* expression | block)
                    ;
                macroWithoutAttrParam
                    : LPAREN NL* macroInputDecl NL* RPAREN
                    ;
                macroWithAttrParam
                    : LPAREN NL* macroAttrDecl NL* COMMA NL* macroInputDecl NL* RPAREN
                    ;
                macroInputDecl
                    : identifier NL* COLON NL* identifier
                    ;
                macroAttrDecl
                    : identifier NL* COLON NL* identifier
                    ;

  @Description: Check trivial macro declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_macros_01.cj
*/

import std.ast.*
import aux_macros_01.*

main() {
    return 0
}