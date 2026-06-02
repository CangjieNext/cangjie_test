/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Also, class can be declared with modifier public, then it can be accessed outside the package.

  @Description: Public classes

  @Structure: complex-aux
*/

package pkg_a02

public class P_Simple {}
public class P_Generic<T> {}

public open class PO_Simple {}
public open class PO_Generic<T, U> {}

public abstract class PA_Simple {}
public abstract class PA_Generic<T, U, V> {}

open public class OP_Simple {}
open public class OP_Generic<T, U, V, W> {}

abstract public class AP_Simple {}
abstract public class AP_Generic<T, U, V, W, X> {}