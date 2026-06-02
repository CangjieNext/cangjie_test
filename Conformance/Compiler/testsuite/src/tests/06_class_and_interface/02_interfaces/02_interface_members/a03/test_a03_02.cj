/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a03_02

  @Level:         1

  @Assertion: 6.2.2(3)
              The syntax of interface members is as follows.
              interfaceMemberDeclaration
                : (functionDefinition|macroExpression|propertyDefinition) end*
                ;

  @Description: Check that a mutable instance variable can not be a member of an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/

interface I {
    var x = 1
}

main() {
}