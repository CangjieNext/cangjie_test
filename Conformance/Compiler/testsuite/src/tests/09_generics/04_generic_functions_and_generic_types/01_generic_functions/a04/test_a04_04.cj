/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a04_04

  @Level:         1

  @Assertion: 9.4.1(4) The syntax of generic functions is as follows. 
              functionDefinition
                  : functionModifierList? 'func' identifier
                  typeParameters functionParameters
                  (':' type)? genericConstraints?
                  ('=' expression | block)?
                  ;

  @Description: Check that missing function parameters causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

func f<T> {
    return x
}

main() {}

