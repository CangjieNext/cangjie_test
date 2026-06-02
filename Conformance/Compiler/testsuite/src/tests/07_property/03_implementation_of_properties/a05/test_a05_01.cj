/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a05_01

  @Level:         1

  @Assertion:   7.3(5)
                class Foo {
                  mut prop a: Int64 {
                    get() { // () -> Int64
                      "123" // error
                    }
                    set(v) { // (Int64) -> Unit
                       123 // error 
                    }
                  }
                  mut prop b: Int64 {
                    get() {
                      123 // ok, return 123
                    }
                    set(v) {
                      () // ok, return unit
                    }
                  }
                }

  @Description: Checks that example is compiler without errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  mut prop b: Int64 {
    get() {
      123 // ok, return 123
    }
    set(v) {
      () // ok, return unit
    }
  }
}

main() {
  return 0
}
