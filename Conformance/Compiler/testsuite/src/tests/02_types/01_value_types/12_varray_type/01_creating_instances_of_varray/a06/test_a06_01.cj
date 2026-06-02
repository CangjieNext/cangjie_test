/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_01_a06_01

  @Level:         1

  @Assertion:   2.1.12.1(6) In addition to this, A VArray instance can also be created by a constructor.
  
  @Description:  Example with constructor

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $..>

*/
import utils.assert.Assert
main() {
    let arr5: VArray<Int64 ,$3> = VArray<Int64 ,$3> { i => 0 * i } 
    Assert.equals(0, arr5[0])
    Assert.equals(0, arr5[1])
    Assert.equals(0, arr5[2])
    0
}