/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a23_03

  @Level:         1

  @Assertion:   10.1.2.1(23) 3. When a function is called, the generic function f
                may be a partially instantiated generic function or a fully instantiated
                function that enters the visible function set.


  @Description:  With 4 args min was not defined. Emit error

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

func custom_min<T>(a:T,b:T,c:T) :T where T <: Comparable<T>{
    custom_min(custom_min(a,b),c)
}

main() {
    var imin3:Int32 = custom_min<Int32>(3,4,5,6)

}