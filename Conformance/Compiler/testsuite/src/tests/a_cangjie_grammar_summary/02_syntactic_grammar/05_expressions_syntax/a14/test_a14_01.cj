/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a14_01

  @Level:         1
  @Assertion:   A.2.5(14)
                thisSuperExpression
                    : THIS
                    | SUPER
                    ;

  @Description: Check trivial this and super expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

open class C1 {
  private let some = 123
  public let other = 123
  public func getSome() {
    this.some
  }
}

class C2 <: C1 {
  public func getOther() {
    super.other
  }
}
main() {
    C1().getSome()
    C2().getOther()
    return 0
}
