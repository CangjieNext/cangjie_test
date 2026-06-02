/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a05_01

  @Level:         1

  @Assertion:   7(5) The following is a simple example where b is a typical property that
                encapsulates external access to a:
                class Foo {
                  private var a = 0
                  mut prop b: Int64 {
                    get() {
                      print("get")
                      a
                    }
                    set(value) {
                      print("set")
                      a = value
                    }
                  }
                }
                main() {
                  var x = Foo()
                  let y = x.b + 1 // get
                  x.b = y // set
                }

  @Description: Checks that example is compiled.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  private var a = 0
  mut prop b: Int64 {
    get() {
      print("get")
      a
    }
    set(value) {
      print("set")
      a = value
    }
  }
}

main() {
  var x = Foo()
  let y = x.b + 1 // get
  x.b = y // set
  return 0
}
