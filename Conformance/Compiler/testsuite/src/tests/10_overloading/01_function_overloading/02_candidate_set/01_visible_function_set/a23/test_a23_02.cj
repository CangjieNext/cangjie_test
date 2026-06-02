/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a23_02

  @Level:         1

  @Assertion:   10.1.2.1(23) 3. When a function is called, the generic function f
                may be a partially instantiated generic function or a fully instantiated
                function that enters the visible function set.


  @Description:  Generic overloaded functions fully and partially  instantiated

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

func custom_min<T>(x: T, y: T): T where T <: Comparable<T> {
    if (x < y) {
      return x
    }
    return y
}

func custom_minN<T,N>(a:T,b:T,c:T, n1:N,n2:N) :T where T <: Comparable<T>
                                                    ,  N <: Equatable<N> & Countable<N> {
   if (n1 == n2) {
     custom_min(custom_min(a,b),c)
   }
   else {
     a
   }
}

func custom_min<T>(a:T,b:T,c:T) :T where T <: Comparable<T> {
    custom_minN<T,Int32>(a,b,c, 0,0)
}


main() {
    var imin3:Int32 = custom_min<Int32>(3,4,5)
    var imin2:Int64 = custom_min<Int64>(-33333333,4)
    Assert.equals(3, imin3)
    Assert.equals(-33333333, imin2)
    var fimin3:Float32 = custom_min<Float32>(3.2,4.4,-5.0)
    var fimin2:Float64 = custom_min<Float64>(-333333.33,4.1f64)
    Assert.equals(-5.0, fimin3)
    Assert.equals(-333333.33, fimin2)

}