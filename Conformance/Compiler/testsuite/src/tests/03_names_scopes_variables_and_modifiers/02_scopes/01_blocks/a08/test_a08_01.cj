/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a08_01

  @Level:         1

  @Assertion:    3.2.1(8)   
                    {    let a = 1
                         let b = 2
                         a + b
                    } // The value of the block is a + b.

  @Description:  Check the example from assertion 3.2.1.(8).

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

func foo03(positive: Int64) : Int64 {
    var blockRes = if (positive > 0) {  
        let a = 1
        let b = 2
        a + b
    }   // The value of the block is a + b = 3
    else {
        0
    }   // The value of the block is 0
    return blockRes
}

func myBoolFunc(i: Int64){
    if(i > 0){
        return false
    }
    return true
}

main() {

//  Test-case 1: consider blocks in if_then operator
    var blockRes01 : Int64 = 0
    let positive = 10
    blockRes01 = if (myBoolFunc(-positive)) {  
        let a = 1
        let b = 2
        a + b
    } // The value of the block is a + b
    else {
        0
    }
    Assert.equals(3, blockRes01)

//  Test-case 2: consider blocks in the else part of if_else operator
    var blockRes02 : Int64 = 0
    let negative = -10
    blockRes02 = if (myBoolFunc(10)) { 
            0
        } 
        else {
            let a = 1
            let b = 2
            a + b
       }  // The value of the block is a + b
    Assert.equals(3, blockRes02)

//  Test-case 3: consider blocks in a function body with return (new scopes)
    var blockRes03 : Int64 = 0
    blockRes03 = foo03(100)
    Assert.equals(3, blockRes03)

//  Test-case 4: consider blocks in internal functions
func foo04(): Int64 { 
        let a = 1
        let b = 2
        a + b
}
    var y04 = foo04()
    Assert.equals(3, y04)

}   //main

