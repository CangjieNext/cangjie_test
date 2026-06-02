/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a04_01

  @Level:         1

  @Assertion:   7.4(4)
                class Foo {
                  private prop a: Int64 { // ok
                    get() { 0 }
                  }
                  protected prop b: Int64 { // ok
                    get() { 0 }
                  }
                  public static prop c: Int64 { // ok
                    get() { 0 }
                  }
                }


  @Description: Checks that example is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class Foo {
  private prop a: Int64 { // ok
    get() { 0 } 
  }
  protected prop b: Int64 { // ok
    get() { 0 }
  }
  public static prop c: Int64 { // ok
    get() { 0 } 
  }
}

main() {
  return 0;
}


