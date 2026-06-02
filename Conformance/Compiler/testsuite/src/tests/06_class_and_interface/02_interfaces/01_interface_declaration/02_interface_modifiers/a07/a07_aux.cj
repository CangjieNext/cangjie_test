/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The public modifier is optional when defining a sealed class
              because the semantics of public are already implied by sealed.

  @Description: Definition of interfaces modified with 'sealed'

  @Structure: complex-aux
*/

package a07

sealed interface I1 {}

sealed interface I2<T> {}

public sealed interface I3 {}

public sealed interface I4<T> {}

public class Impl1 <: I1 {}
public class Impl2 <: I2<Unit> {}
public class Impl3 <: I3 {}
public class Impl4 <: I4<Unit> {}