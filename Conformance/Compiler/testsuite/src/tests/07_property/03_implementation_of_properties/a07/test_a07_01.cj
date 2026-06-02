/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a07_01

  @Level:         1

  @Assertion:   7.3(7)
                class Foo {
                  prop i: Int64 {
                    get() {
                      i // dead loop
                    }
                  }
                }

  @Description: Checks that example gives StackOverflowError at runtime.

  @Mode:        CompileOnly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  prop i: Int64 {
    get() {
      i // dead loop
    }
  }
}

main() {
  var x = Foo()
  var y = x.i
  return 0
}
