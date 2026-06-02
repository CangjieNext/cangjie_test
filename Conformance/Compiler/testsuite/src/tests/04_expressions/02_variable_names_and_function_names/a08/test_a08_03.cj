/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a08_03

  @Level:         1

  @Assertion: 4.2(8) Also, it supports generics functions (See chapter 9) to
              declare type parameters. In this situation, generic function 
              names can be used as expressions if type arguments are given.
  @Description: Checks that generic function name with the type parameter list
                cannot be used as an expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

func f<T> {
}

main() {
    f<T>
    return
}
