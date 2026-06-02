/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_04_a16_01

  @Level:         1

  @Assertion:   7.4(16)
                open class A {
                  public open prop v: Int64 {
                    get() { 1 }
                  }
                }
                class B <: A {
                  public override prop v: Int64 {
                    get() { super.v + 1 }
                  }
                }

  @Description: Checks that example is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006209


*/

open class A {
  public open prop v: Int64 {
    get() { 1 }
  }
}
class B <: A {
  public override prop v: Int64 {
    get() { super.v + 1 }
  }
}

main() {
  return 0;
}


