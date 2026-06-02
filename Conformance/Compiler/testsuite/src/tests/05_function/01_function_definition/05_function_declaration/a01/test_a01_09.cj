/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_05_a01_09

  @Level:         1

  @Assertion:     5.1.5(1) In Cangjie programming language, the difference between function declaration and function 
                  definition is that the former has no function body. 
                  The syntax of the function declaration is as follows: 
                  functionDefinition 
                    : functionModifierList? 'func' 
                    identifier 
                    typeParameters? 
                    functionParameters 
                    (':' type)? 
                    genericConstraints? 
                    ; 

  @Description:   Check that abstract interface function can't be declared without return type.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:          6250

*/

interface myInterface {
    func myIFunc(a: Int32)
}

main() {
  
}
