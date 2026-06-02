/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a05_01

  @Level:         1

  @Assertion:   7.1(5) As shown in the example below, a is a property declared using let
                and b is a property declared using var.
                class Foo {
                  prop a: Int64 {
                    get() {
                      0
                    } 
                  }
                  mut prop b: Int64 {
                    get() {
                      0
                    }
                    set(v) {} 
                  }
                }


  @Description: Checks example.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  prop a: Int64 {
    get() {
      0
    } 
  }
  mut prop b: Int64 {
    get() {
      0
    }
    set(v) {} 
  }
}

main() {
  var x = Foo()
  let r1 = x.a
  let r2 = x.b
  x.b = 222
  return 0;
}


