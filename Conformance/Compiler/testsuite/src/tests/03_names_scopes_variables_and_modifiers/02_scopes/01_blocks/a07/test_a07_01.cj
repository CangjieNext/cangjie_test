/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a07_01

  @Level:         1

  @Assertion:    3.2.1(7)   If the last item of the block is an expression, the value 
                 of the expression is the value of the block when the expression is evaluated

  @Description:  Checks that the value of a block with expressions is the value of the last evaluated expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {

//  Test-case 1: Check that the value of a block is determined by evaluating the last expression 
    
    var blockRes01 : Int64 = {a: Int64, b:Int64, c:Int64 => let d = 5; a * d + b * c} (1, 2, 3)
    Assert.equals(11, blockRes01)

//  Test-case 2: Check that the value of a block without expressions is UNIT
    
    var blockRes02 : Unit = {a : Int64, b : Int64 => var add : Int64 = 10; let mult : Int64 = -5} (1, 5)
    Assert.isTrue(blockRes02 is Unit)

//  Test-case3: Check that internal declarations can effect the value of the block 
    
    var blockRes03 : Int64 = {a : Int64, b : Int64 => let mult = 3; var add : Int64 = 7; add * a + mult * b} (2, 3)
    Assert.equals(23, blockRes03)

//  Test-case 4: Check that if the last item of the block is a declaration the value of the block is UNIT
    
    var blockRes04 : Unit = 
        {a : Int64, b : Int64, c:Int64 => let add = 10; 4 * add + a * b; var new : Int64 = 7} (1, 2, 3)
    Assert.isTrue(blockRes04 is Unit)
    
}   //main


