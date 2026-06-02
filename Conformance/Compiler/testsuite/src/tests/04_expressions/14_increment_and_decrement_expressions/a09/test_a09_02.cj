/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a09_02

  @Level:         1

  @Assertion: 4.14(9) Examples for using increment and decrement expressions:

              var i: Int32 = 5 
              i++ // i = 6
              i-- // i = 5
              i--++ // syntax error 
              let j = 0
              j = i-- // semantics error

  @Description: Check the 'i--++' negative part of the example.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var i: Int32 = 5 
    i--++
    return
}

