/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a10_01

  @Level:         1
 
  @Assertion:    3.2.1(10)    
                    {
                         let a = 1
                    } // The value of the block is ()

  @Description:  Check that the value of a block with only declarations is ().

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    
//  Test-case 1:  check that the value of a block with only let declarations is ()

    var blockRes : Unit = {par1 : Int64, par2 : Int64 => let a = 1} (1, 5)
    Assert.isTrue(blockRes is Unit)

//  Test-case 2:  check that the value of a block with only var declarations is ()

    var blockRes02 : Unit = {a:Int64, b:Int64 => var add:Int64 = 7; var v:Int64 = 50} (1, 5)
    Assert.isTrue(blockRes02 is Unit)

//  Test-case 3: check that if the block contains expressions it's not () 

    var blockRes03 : Int64 = {a:Int64, b:Int64 => var add:Int64 = 10; a * b + add} (3, 5)
    Assert.equals(25, blockRes03)

//  Test-case 4: check that if the block with var declarations contains expressions it's not () 

    var blockRes04 : Int64 = {a:Int64, b:Int64 => var add:Int64 = 20; a * b + add} (2, 5)
    Assert.equals(30, blockRes04)
	
//  Test-case 5: check that if the block with let declarations contains expressions it's not () 

    var blockRes05 : Int64 = {a:Int64, b:Int64 => let add = -20; a * b + add} (4, 5)
    Assert.equals(0, blockRes05)

}  //main

