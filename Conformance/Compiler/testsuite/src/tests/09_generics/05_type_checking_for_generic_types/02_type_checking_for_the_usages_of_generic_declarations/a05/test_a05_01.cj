/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a05_01

  @Level:         1

  @Assertion: 9.5.2(5) 
              interface I {
                  static func f(): Unit
              }

              func g<T>(): Unit where T <: I {}

              main() {
                  g<I>() // error
                  return 0
              }

  @Description: Check the example provided.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    static func f(): Unit
}

func g<T>(): Unit where T <: I {}

main() {
    g<I>() // error
    return 0
}

