/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a01_05

  @Level:         1

  @Assertion:    10.1.2.2(1) The type check is performed on functions in the visible function set
 
  
  @Description:  Overloading functions with generic arguments.
                 
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

func custom_max<T>(x: T, y: T): T where T <: Comparable<T> {
    if (x > y) {
      return x
    }
    return y
}

func custom_max<T>(a:T,b:T,c:T) :T where T <: Comparable<T>{
    custom_max(custom_max(a,b),c)
}

main() {
    var imax3:Int32 = custom_max<Int32>(3,4,5)
    var imax2:Int64 = custom_max<Int64>(33333333,4)
    Assert.equals(5, imax3)
    Assert.equals(33333333, imax2)
    var fimax3:Float32 = custom_max<Float32>(3.2,4.4,5.0)
    var fimax2:Float64 = custom_max<Float64>(333333.33,4.1f64)
    Assert.equals(5.0, fimax3)
    Assert.equals(333333.33, fimax2)

}


