/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: default: no modifier means that it can only be accessed within the current package

  @Description: Definition of a class with the default constructor

  @Structure: complex-main
*/
package a41

open public class A41Aux {
  init() {}
  public A41Aux(x: Int64) {}
}