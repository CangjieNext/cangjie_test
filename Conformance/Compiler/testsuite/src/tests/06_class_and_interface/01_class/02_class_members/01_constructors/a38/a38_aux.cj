/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: public: default modifier of a constructor,
              indicating that the constructor can be accessed outside the class.

  @Description: Definition of a class with the public constructor

  @Structure: complex-aux
*/

package a38

public var remote_call = false

public open class A38Aux {
  public init() {
    remote_call = true
  }
}