
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_24_a01_01

  @Level:         1

  @Assertion:   4.24(1) A lambda expression is a value of a function type. See the Chapter 5 Functions for more
                details.
  @Description: Checks compilation and execution of a program that uses lambda expressions. Checks that lambda
                expressions have a function type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.equals("ab", "a" |> {s: String => s + "b"})
    Assert.equals(12345, { => 12345}())
    Assert.equals(false, {b1 : Bool, b2 : Bool => return b1 && b2}(true, false))

    Assert.isTrue({s: String => s + "b"} is (String) -> String)
    Assert.isTrue({x : Int64, y : Float64 => return x.toString() + y.toString()} is (Int64, Float64) -> String)
    Assert.isTrue({_ : Unit => 12345u32} is (Unit) -> UInt32)
}

