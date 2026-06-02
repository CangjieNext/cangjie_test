/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: You can also use the sealed modifier to indicate that the interface can be inherited,
              implemented, or extended only in the package which the interface is defined.

  @Description: Define interfaces modified with 'sealed'

  @CompileWarning: yes

  @Structure: complex-aux
*/

package a06

sealed interface I1 {}

sealed interface I2<T> {}

sealed public interface I3 {}

sealed public interface I4<T> {}
