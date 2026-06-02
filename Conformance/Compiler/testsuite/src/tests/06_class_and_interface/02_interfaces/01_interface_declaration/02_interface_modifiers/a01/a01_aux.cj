/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Access modifier: If no access modifier is used when defining an interface,
              then the interface can only be accessed inside the package

  @Description: Defines non-public interfaces

  @Structure: complex-aux
*/

package a01

interface I1 {}

interface I2<T> {}