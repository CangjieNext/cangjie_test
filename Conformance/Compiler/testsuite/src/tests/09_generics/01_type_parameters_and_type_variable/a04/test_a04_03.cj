/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a04_03

  @Level:         1

  @Assertion: 9.1(4) When using an identifier to refer a type introduced by a declaration of type parameters, the 
              identifier is called type variable. The Syntax of type parameter is as follows.
              typeParameters
                  : '<' identifier (',' identifier)* '>'
                  ;

  @Description: Check that typeParameters not containing an identifier causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

class GenericClass1<5> {
}

main() {
}

