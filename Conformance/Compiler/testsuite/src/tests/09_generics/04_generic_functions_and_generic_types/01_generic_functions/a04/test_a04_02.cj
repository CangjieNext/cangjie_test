/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a04_02

  @Level:         1

  @Assertion: 9.4.1(4) The syntax of generic functions is as follows. 
              functionDefinition
                  : functionModifierList? 'func' identifier
                  typeParameters functionParameters
                  (':' type)? genericConstraints?
                  ('=' expression | block)?
                  ;

  @Description: Check that missing func keyword causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

f1<T>(x: T) {
    return x
}

main() {}

