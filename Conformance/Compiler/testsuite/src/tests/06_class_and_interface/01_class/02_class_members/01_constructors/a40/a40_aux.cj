/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: protected: indicates that the constructor can only be accessed
              in the current package or in subclasses outside the current package.

  @Description: Definition of a class with the protected constructor

  @Structure: complex-aux
*/

package a40

public var remote_call = false

open public class A40Aux {
  protected init() {
    remote_call = true
  }
}