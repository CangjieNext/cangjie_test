/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: If the sub-interface of a sealed interface is modified by public but not by sealed,
              the sub-interface can be inherited, implemented, or extended outside the package.

  @Description: Definition of public non-sealed classes and interfaces that
                implement and inherit sealed interfaces

  @Structure: complex-aux
*/

package a09

sealed interface SI1 {}
sealed interface SI2<T> {}

public interface I1 <: SI1 {}
public interface I2<T> <: SI2<T> {}

public open class OC1 <: SI1 {}
public open class OC2<T> <: SI2<T> {}