
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a02_01

  @Level:         1

  @Assertion:   4.15(2)  Except for the unary negative operator which is a unary prefix operator, all other operators
                are binary infix operators. See the last section for their precedence and associativity.
  @Description: Checks that '+' cannot be an unary prefix operator. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    println(+1)
}
