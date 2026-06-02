/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a01_02

  @Level:         1

  @Assertion:     5.1(1)
                  In the Cangjie programming language, a function is defined with the following syntax.
    functionDefinition
              : functionModifierList? 'func'
             identifier
             typeParameters?
             functionParameters
              (':' type)?
              (genericConstraints)?
             block
              ;

  @Description:   Check that function declaration in other package w/o public modifier is not accessible in current package.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     complex-main

  @Dependencies:  aux_module.cj

*/
import mod_05_01_a01.pkg.myLocalFunc as outideLocalFunc
main() {
}
