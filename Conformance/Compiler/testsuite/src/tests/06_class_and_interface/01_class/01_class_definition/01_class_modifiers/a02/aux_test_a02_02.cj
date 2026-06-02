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

package a02

public class PDF_Simple {}
public class PDF_Generic<T> {}

public open class PODF_Simple {}
public open class PODF_Generic<T, U> {}

public abstract class PADF_Simple {}
public abstract class PADF_Generic<T, U, V> {}

open public class OPDF_Simple {}
open public class OPDF_Generic<T, U, V, W> {}

abstract public class APDF_Simple {}
abstract public class APDF_Generic<T, U, V, W, X> {}