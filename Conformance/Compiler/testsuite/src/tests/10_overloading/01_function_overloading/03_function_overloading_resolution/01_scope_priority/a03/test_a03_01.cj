/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a03_01

  @Level:         1

  @Assertion:    10.1.3.1(3) 1. Functions defined in the super classes and 
                 sub classes in the candidate set are processed as the same
                 scope priority when the functions are overloaded.
 
  @Description:  Overloading is solved due to class names

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Parent {   
     public static func Verify(arg:Int32):Int64 {
        0
    }
}
open class Sub <: Parent {
    public static func Verify(arg:Int32):Int64 {
        1
    }

}
main(ina :Array<String>) {
    Assert.equals(1,Sub.Verify(Int32(1)))
    Assert.equals(0,Parent.Verify(Int32(0)))
    0
}

