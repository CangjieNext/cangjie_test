/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a27_01_pipeline

  @Level:         1

  @Assertion:    1.4(27) |> Pipeline
 
  @Description:  Check lexical ability of |> Pipeline

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/


import utils.assert.Assert


func f2(x: Int32): Int32 { x + x }

main () {
    let a: Int32 = 1
    var res = a |> f2
    Assert.equals(2,res)
    var res1 = res |> {x: Int32 => x + 1}
    Assert.equals(2,res)
    Assert.equals(3,res1)
}

