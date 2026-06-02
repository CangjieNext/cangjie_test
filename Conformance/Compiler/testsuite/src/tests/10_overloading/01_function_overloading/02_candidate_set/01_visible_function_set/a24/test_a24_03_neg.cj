/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a24_03_neg

  @Level:         1

  @Assertion:    10.1.2.1(24) The form of a visible function is determined 
                 by the form of the calling expression, which are described 
                 in detail in Section Generic Function Overloading.

  

  @Description:  Emit error due to extra generic ergument

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


func custom_min<T>(x: T, y: T): T where T <: Comparable<T> {
    if (x < y) {
      return x
    }
    return y
}

func custom_min<T,ZT>(a:T,b:T,c:T) :T where T <: Comparable<T>{
    custom_min(custom_min(a,b),c)
}

main() {
    var imin3:Int32 = custom_min<Int32,Int16>(3,4,5)
    var imin2:Int64 = custom_min<Int64,Int32>(-33333333,4)
}