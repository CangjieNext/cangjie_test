/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_03_a02_01

  @Level:         1

  @Assertion: 9.5.3(2) For example: 

              class A<T> {
                  func test(a: A<(A<T>, A<T>)>): Bool {true}
              }
              
              main(): Int64 {
                  var a : A<Int32> = A<Int32>()
                  return 0
              }

              The above program will report infinite instantiation error. 

  @Description: Check the example provided.

  @Mode: compileonly

  @Negative: yes

*/

class A<T> {
    func test(a: A<(A<T>, A<T>)>): Bool {
        true
    }
}
              
main(): Int64 {
    var a : A<Int32> = A<Int32>()
    return 0
}

