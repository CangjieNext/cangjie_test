/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a02_02

  @Level:         1

  @Assertion:   2.1.10(2) The following grammar shows the definition of struct types:
                 structDefinition
                  : structModifier? 'struct' identifier typeParameters? ('<:' superInterfaces)? 
                    genericConstraints? structBody
                  ;
  
                 structBody
                  : '{'
                   structMemberDeclaration*
                   structPrimaryInit?
                   structMemberDeclaration*
                  '}'
                  ;
  
                 structMemberDeclaration
                  : structInit
                  | staticInit
                  | variableDeclaration
                  | functionDefinition
                  | operatorFunctionDefinition
                  | macroExpression
                  | propertyDefinition
                  ;

                In above, structModifier indicates the modifier of struct, and struct is the keyword, 
                and identifier is the name of the struct type. 
                typeParameters and genericConstraints are list of type variables 
                and their constraints (refer to chapter 9 for generics), respectively.

  @Description: Check that correctly defined struct with macroExpression is compiled correctly.

  @Mode:        compileOnly
  @Negative:    no

  @Structure:    complex-aux
  @Dependencies: macro_defs.cj
*/

import macros.*;

public struct TestA0202 {
  @Macro1[varName]("varValue");

  @Macro2[letName]("letValue");

  @Macro3[function1](return "S1");

  @Macro4
  func function2() { return true };
}


main() {
    let testStructVar: TestA0202 = TestA0202();
}

