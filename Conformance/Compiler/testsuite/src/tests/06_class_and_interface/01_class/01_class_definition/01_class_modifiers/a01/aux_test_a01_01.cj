/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Access modifier: If no access modifier is used when defining a class, 
              then the class can only be accessed inside the package.

  @Description: Classes from the same package but different file to check the assertion

  @Structure: complex-aux
*/

package a01

open class OCDF_Simple {}
open class OCDF_Generic<T, U> {}

abstract class ACDF_Simple {}
abstract class ACDF_Generic<T1, T2, T3, T4> {}

class CDF_Simple {}
class CDF_Generic<P> {}