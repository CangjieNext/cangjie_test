
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  package A from the example
  @Structure:    complex-aux
*/

package a
sealed abstract class C1 {} // OK
sealed abstract class C2 {} // OK, 'public' is optional when 'sealed' is used

class S1 <: C1 {} // OK
public open class AuxA18 <: C1 {} // OK
sealed abstract class S3 <: C1 {} // OK
open class S4 <: C1 {} // OK
