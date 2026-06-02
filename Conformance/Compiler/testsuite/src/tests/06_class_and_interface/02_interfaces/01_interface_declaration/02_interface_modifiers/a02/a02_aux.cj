/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Also, interfaces can be declared with modifier public,
              then the interface can be accessed outside the package.

  @Description: Define public interfaces

  @Structure: complex-aux
*/

package a02

public interface I1 {}

public interface I2<T> {}

public open interface I3 {}