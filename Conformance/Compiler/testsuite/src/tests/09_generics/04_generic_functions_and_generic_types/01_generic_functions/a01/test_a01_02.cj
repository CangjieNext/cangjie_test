/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a01_02

  @Level:         1

  @Assertion: 9.4.1(1) If a function is declared with on or more type parameters, it is called a generic function. 
              Syntax-wise, type parameters are placed immediately after the function name and are enclosed in <>.

  @Description: Check that missing <> causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

func id T (x: T) {
    return x
}

main() {}

