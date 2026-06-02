/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a28_01_composition

  @Level:         1

  @Assertion:    1.4(28) ~> Composition
 
  @Description:  Check lexical ability of  ~> Composition

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/


import utils.assert.Assert


func sum(x: Int32): Int32 {
    x + x 
}
func quad(x: Int32): Int32 {
    x * x 
}

main () {
    var qs = sum ~> quad
    Assert.equals(36,qs(3))
    0
}

