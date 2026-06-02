/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_05_a01_01

  @Level:         1
  @Assertion:   A.2.3.5(1) 
                enumDefinition
                    : (enumModifier NL*)? ENUM NL* identifier (NL* typeParameters NL*)?
                    (NL* UPPERBOUND NL* superInterfaces)?
                    (NL* genericConstraints)? NL* LCURL end* enumBody end* RCURL
                    ;
                enumBody
                    : (BITOR NL*)? caseBody (NL* BITOR NL* caseBody)*
                    (NL*
                    ( functionDefinition
                    | operatorFunctionDefinition
                    | associatedTypeDefinition
                    | propertyDefinition
                    | macroExpression
                    ))*
                    ;
                caseBody
                    : identifier ( NL* LPAREN NL* type (NL* COMMA NL* type)* NL* RPAREN)?
                    ;
                enumModifier
                    : PUBLIC
                    ;

  @Description: Check trivial enum declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

enum HandGame {
    ROCK | PAPER | SCISSORS
}

public enum HandGame2 {
    ROCK | PAPER | SCISSORS
}

enum E {
    | F | F(Unit) | F(Rune, E) | F(() -> String, String, (String, String)) | F(Bool, Int8, Int16, Int32)
}

enum E2 {
    E1 | E1(E2) | E1(E2, E2)
}

main() {
    return 0
}