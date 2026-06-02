
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with class definitions
  @Structure:    complex-aux
*/

package p

sealed abstract class C { }

public open class C1 <: C { }

sealed abstract class A { }

public open class C2 <: A { }

sealed abstract class G<T> { }

public open class C3 <: G<Unit> { }
