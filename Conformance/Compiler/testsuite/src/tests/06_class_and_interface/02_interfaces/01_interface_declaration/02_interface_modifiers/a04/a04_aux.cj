/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Inheritance modifier: By default, the interface has the semantics
              of the open modifier without using the inheritance modifier,
              indicating that the interface can be inherited, implemented,
              or extended anywhere the interface can be accessed.

  @Description: Definition of public interfaces

  @Structure: complex-aux
*/

package a04

public interface I1 {}

public interface I2<T> {}