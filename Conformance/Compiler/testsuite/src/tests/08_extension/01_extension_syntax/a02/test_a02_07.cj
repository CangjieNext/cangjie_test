/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 08_01_a02_07

  @Level:         1

  @Assertion: 8.1(2)
              The syntax of the extended definition is as follows.

              extendDefinition
                  : 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
                  ;

              extendType
                  : (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
                  ;

              extendBody
                  : '{' extendMemberDeclaration* '}'
                  ;

              extendMemberDeclaration
                  : (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
                  ;

  @Description: Check that 'extendBody' without '{' causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

extend String }

main() {}

