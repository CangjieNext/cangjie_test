/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a02_01

  @Level:         1

  @Assertion:   7.4(2)
                class Foo {
                  public mut prop a: Int64 { // ok
                    get() {
                      0
                    }
                    set(v) {}
                  }

                  mut prop b: Int64 {
                    public get() { // error
                      0
                    }
                    public set(v) {} // error
                  }
                }

  @Description: Checks that example is compiled with no errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  public mut prop a: Int64 { // ok
    get() {
      0
    }
    set(v) {} 
  }

  //mut prop b: Int64 {
  //  public get() { // error
  //    0
  //  }
  //  public set(v) {} // error
  //}
}

main() {
  return 0;
}


