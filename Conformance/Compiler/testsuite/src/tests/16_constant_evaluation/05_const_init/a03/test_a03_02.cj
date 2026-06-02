
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a03_02

  @Level:         1

  @Assertion:   16.5(3) 3.If an instance member variable of the current type has an initial value, the initial value
                must be a const expression, otherwise const init is not allowed to be defined.
  @Description: Check that const init in a struct is not allowed if a `var` instance member variable is direcly
                initialized with a non-const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func nonConstExpr() { 1 }

struct S {
    var v = nonConstExpr()

    const init() { }
}

main() { }
