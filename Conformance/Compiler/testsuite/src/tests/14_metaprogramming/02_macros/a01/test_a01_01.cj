/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a01_01

  @Level:         1

  @Assertion:    14.2(1) Macros and functions are similar in that they can be called/invoked, and have input and output. 

  @Description:  Check that macros can be called/invoked and have input/output
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

func PI() { return 3.1415 }

public class MyClass {
    static var PI = @PI()
}

public struct MyStruct {
    var PI = @PI()
}

func foo() { return @PI() }

main(): Unit {
    var pi_f = PI()
    var pi_m = @PI()
    var pi_fm = foo()
    var pi_cls = MyClass.PI
    var strct = MyStruct()
    var pi_strct = strct.PI
    var pi_plus_one: Float64 = @PlusOne[Float64](3.141516)

    Assert.approxEquals(3.1415, pi_f)
    Assert.approxEquals(3.1415, pi_m)
    Assert.approxEquals(3.1415, pi_fm)
    Assert.approxEquals(3.1415, pi_cls)
    Assert.approxEquals(3.1415, pi_strct)
    Assert.approxEquals(4.141516, pi_plus_one)
}
