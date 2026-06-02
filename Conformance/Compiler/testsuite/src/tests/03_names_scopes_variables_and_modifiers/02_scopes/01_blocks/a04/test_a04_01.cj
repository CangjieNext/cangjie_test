/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a04_01

  @Level:         1

  @Assertion:    3.2.1(4) The syntax of block is:
                    block
                         : '{' expressionOrDeclarations '}'.

  @Description:  Check that the syntax above defines blocks.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

func myBoolFunc(i: Int64){
    if(i > 0){
        return false
    }
    return true
}

main() {

//  Test-case 1: check that syntax above with declarations defines a block (new scope)
    
    let x01 = 1
    var y01 : Int64 = 2 * x01

    if (x01 > 0) {
        var y01 : Int64 = 3 * x01
        Assert.equals(3, y01)
    }
    Assert.equals(2, y01)

//  Test-case 2: check that syntax with expressions defines a block (new scope)
    
    let x02 = 10
    var y02 : Int64 = 2 * x02
    var diff02 : Int64
    
    if (x02 > 0) {
        y02 += 3 * x02
        diff02 = y02 - 2  * x02
    }
    Assert.equals(50, y02)

//  Test-case 3: check that syntax with declarations defines a block (new scope)

    let x03 = 10
    var y03 : Int64 = 2 * x03

    if (x03 > 0) {
        let x03 = 100
        var y03 : Int64 = 3 * x03
        var sum03 = x03 + y03
    } 
    Assert.equals(20, y03)

// Test-case 4: check that syntax below allows one to define an empty block 

    let x04 = 10
    var y04 : Int64 = 2 * x04
    if (myBoolFunc(0)) { }
    else {
        var y04 : Int64 = 3 * x04
        y04 += x04
    } 
    Assert.equals(20, y04)

// Test-case 5: check that syntax allows to define values of blocks in if_else 
    let x05 = 100
    var y05 : Int64 = 2 * x05
    var res05: Int64 = if (myBoolFunc(0)) {
        var y05 : Int64 = 3 * x05
        Assert.equals(300, y05)
        y05 + x05
    }
    else {
        var y05 : Int64 = 4 * x05
        Assert.equals(400, y05)
        y05 - x05
    } 
    Assert.equals(200, y05)
    
}    //main


