/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a02_01

  @Level:         1

  @Assertion:    14.2(2) The difference is that macro code is expanded during compilation.

  @Description:  Check that macros are expanded during compilation
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

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
    var pi_plus_one: Float64 = @PlusOne[Float64](3.15)
}
