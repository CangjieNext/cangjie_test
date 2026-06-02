/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: private: indicates that the constructor can be accessed only within the class.

  @Description: Definition of a class with the private constructor

  @Structure: complex-aux
*/

package a39

public open class A39Aux {
  private init() {}

  public A39Aux(x: Int64) {}
}