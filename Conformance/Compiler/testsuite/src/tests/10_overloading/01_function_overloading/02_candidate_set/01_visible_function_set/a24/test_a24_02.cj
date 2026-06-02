/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a24_02

  @Level:         1

  @Assertion:    10.1.2.1(24) The form of a visible function is determined 
                 by the form of the calling expression, which are described 
                 in detail in Section Generic Function Overloading.

  @Description:  Different forms of overloaded calls depend on generic aruments
                 generic routines in generic class 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
class Klass<TK> {
    public static func custom_min<T>(x: T, y: T): T where T <: Comparable<T> {
        if (x < y) {
          return x
        }
        return y
    }

    public static func custom_min<T,ZT>(a:T,b:T,c:T) :T where T <: Comparable<T>{
        custom_min(custom_min(a,b),c)
    }
}

main() {
    var imin3:Int32 = Klass<Float32>.custom_min<Int32,Int16>(3,4,5)
    var imin2:Int64 =  Klass<Int32>.custom_min<Int64>(-33333333,4)
    Assert.equals(3, imin3)
    Assert.equals(-33333333, imin2)
    var fimin3:Float32 = Klass<Int32>.custom_min<Float32, Float16>(3.2,4.4,-5.0)
    var fimin2:Float64 = Klass<Float32>.custom_min<Float64>(-333333.33,4.1f64)
    Assert.equals(-5.0, fimin3)
    Assert.equals(-333333.33, fimin2)

}