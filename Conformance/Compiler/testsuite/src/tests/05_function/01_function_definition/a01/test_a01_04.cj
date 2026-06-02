/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a01_04

  @Level:         1

  @Assertion:     5.1(1) In the Cangjie programming language, a function is defined with the following syntax. 
    functionDefinition 
              : functionModifierList? 'func' 
             identifier 
             typeParameters? 
             functionParameters 
              (':' type)? 
              (genericConstraints)? 
             block 
              ;

  @Description:   Check that function definition w/o identifier will produce error.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func (): String {"wrong"}
main() {
}
