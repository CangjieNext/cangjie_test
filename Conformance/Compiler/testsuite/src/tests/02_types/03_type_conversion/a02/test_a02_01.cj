/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_03_a02_01

  @Level:         1

  @Assertion:   2.3(2) For classes and interfaces, type casting is achieved by 
                using the as operator (See The as Operator).

  @Description:  Check that the as operator is available and can perform conversions 

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

interface BaseI {}
interface ImplI <: BaseI {}

open class BaseCls {}
open class ImplCls <: BaseCls {}

class Base_Base <: BaseCls & BaseI {}
class Base_Impl <: BaseCls & ImplI {}
class Impl_Impl <: ImplCls & ImplI {}
class Impl_Base <: ImplCls & BaseI {}

main(): Unit {
    let b = BaseCls()
    let i = ImplCls()
    let i_i = Impl_Impl()
    let i_b = Impl_Base()
    
    let i2b = i as BaseCls
    let i2i = i as ImplCls
    let ii2b = i_i as BaseCls
    let ib2b = i_b as BaseCls

    Assert.isTrue(i2b.getOrThrow() is BaseCls)
    Assert.isTrue(i2i.getOrThrow() is ImplCls)
    Assert.isTrue(ii2b.getOrThrow() is BaseCls)
    Assert.isTrue(ib2b.getOrThrow() is BaseCls)
    Assert.isTrue(ii2b.getOrThrow() is ImplI)
    Assert.isTrue(ib2b.getOrThrow() is BaseI)
}
