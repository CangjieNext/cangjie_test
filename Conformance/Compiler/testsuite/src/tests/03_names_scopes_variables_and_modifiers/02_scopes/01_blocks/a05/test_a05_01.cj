/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a05_01

  @Level:         1

  @Assertion:    3.2.1(5) Blocks have their values. The value of a block is determined by 
                 the sequence of expressions and declarations within it.

  @Description:  Checks that blocks have values.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

main() {

//  Test-case 1: Check that the value of a block is determined by a sequence of expressions 
    
    var blockRes01 : Int64 = {a: Int64, b: Int64, c: Int64 => a + b *c} (1, 2, 3)
    Assert.equals(7, blockRes01)

//  Test-case 2: Check that the value of a block is determined by a sequence of declarations (value = UNIT)
    
    var blockRes02 : Unit = {a : Int64, b : Int64 => var add : Int64 = 7; let mult : Int64 = 50} (1, 5)
    Assert.isTrue(blockRes02 is Unit)

//  Test-case3: Check that the value of a block is determined by a sequence of declarations and expressions 
    
    var blockRes03 : Int64 = {a : Int64, b : Int64 => var add : Int64 = 7; add + a * b} (2, 3)
    Assert.equals(13, blockRes03)

//  Test-case4: Check that the value of a block is determined by a sequence of expressions 
    
    var blockRes04 : Unit = {a : Int64, b : Int64 => 4 + a * b; var new : Int64 = 7} (1, 2)
    Assert.isTrue(blockRes04 is Unit)

//  Test-case5: Check that the value of a block is determined by a sequence of expressions 
    
    var blockRes05 : Unit = {a : Int64, b : Int64 => 5 + a * b; let new = 7} (1, 2)
    Assert.isTrue(blockRes05 is Unit)

}
