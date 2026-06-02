/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_21

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that flow expressions have type and value.
                Tests infix operator |> (pipeline) and infix operator ~> (composition).
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let x: Int64 = 5

func f(x: Int32): Float32 { 
    Float32(x) 
}

func g(x: Float32): Int32 { 
    Int32(x) 
}

main() {
    Assert.isTrue((x |> { x: Int64 => x + 1 }) is Int64)
    Assert.equals(6, (x |> { x: Int64 => x + 1 }))

    var fg = f ~> g
    Assert.isTrue(fg is (Int32) -> Int32)
    Assert.equals(1, fg(1))
}
