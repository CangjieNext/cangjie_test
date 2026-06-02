/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a03_51

  @Level:         1

  @Assertion: 6.1.2.4(3)
              The syntax of function definitions and declarations in classes is as follow:
              functionDefinition
                : modifiers 'func' identifier typeParameters? functionParameters (':' returnType)?
                genericConstraints? (('=' expression) | block)?
                ;

  @Description: Check that a function can not have two parameter lists
                when the first one is empty

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006165

*/

abstract class A {
    func f()(a!: Bool, b!: Rune = 'c') {}
}

main() {
}
