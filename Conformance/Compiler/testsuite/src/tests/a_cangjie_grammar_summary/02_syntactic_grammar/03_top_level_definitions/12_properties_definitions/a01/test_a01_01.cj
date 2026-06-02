/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_12_a01_01

  @Level:         1
  @Assertion:   A.2.3.12(1) 
                propertyDefinition
                    : propertyModifier* NL* PROP NL* (LET | VAR) NL* identifier NL* 
                    COLON NL* type NL* propertyBody?
                    ;
                propertyBody
                    : LCURL end* propertyMemberDeclaration+ end* RCURL
                    ;
                propertyMemberDeclaration
                    : GET NL* LPAREN RPAREN NL* block end*
                    | SET NL* LPAREN identifier RPAREN NL* block end*
                    ;
                propertyModifier
                    : PUBLIC
                    | PRIVATE
                    | PROTECTED
                    | STATIC
                    | OPEN
                    | OVERRIDE
                    | REDEF
                    | MUT
                    ;

  @Description: Check trivial properies declarations.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124
*/

class C1 {
  public mut prop p1 : Int32 {
    get() { -1 }
    set(v) {}
  }
}

main() {
    return 0
}