/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a11_01

  @Level:         1

  @Assertion:    3.2.1(11) If the block does not contain any expression or statement, the value of the block is ():
                            { } // The value of this empty block is ().

  @Description:  Check that the value of an empty block is ().

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

//  Function body is an empty block
func foo01(a: Int64) { }

main() {

//  Test-case 1:  check that the value of an empty function body is ()

    var res = foo01(0)
    Assert.isTrue(res is Unit)

//  Test-case 2:  check that the value of an empty if_block is ()

    let x02 = 100
    var ifRes : Unit = if (x02 > 0) { }
    Assert.isTrue(ifRes is Unit)

//  Test-case 3: check that the value of an empty for_in_loop block is ()

    let evenRange03 = 10..=20:2    
    var forInRes : Unit = for (value in evenRange03 ) { }
    Assert.isTrue(forInRes is Unit)

//  Test-case 4: check that if the block doesn't contain any expression, the value of the block is () 

    var blockRes04 : Unit = {a:Int64, b:Int64 => var add:Int64 = 7; let new : Int64 = 10; var v:Int64 = 50} (1, 5)
    Assert.isTrue(blockRes04 is Unit)

//  Test-case 5: check that if the block of lambda is empty, the value of the block is () 

    var blockRes05 : Unit = {a : Int64 => } (1)
    Assert.isTrue(blockRes05 is Unit)

}   //main

