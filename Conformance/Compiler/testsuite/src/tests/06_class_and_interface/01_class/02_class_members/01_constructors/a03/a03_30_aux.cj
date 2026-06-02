/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Modifier: optional. Primary constructors can be modified with one of
              public, protected, or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Definition of a class with a private primary constructor

  @Structure: complex-aux
*/

package p30

public open class A0330Aux {
  private A0330Aux(x: Int64) {}
  public init() {}
}

main() {
}
