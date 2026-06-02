/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Of course, it is allowed to explicitly use the open modifier before the interface definition

  @Description: Definition of public interfaces with the 'public' modifier

  @Structure: complex-aux
*/

package a05

open public interface I1 {}

open public interface I2<T> {}