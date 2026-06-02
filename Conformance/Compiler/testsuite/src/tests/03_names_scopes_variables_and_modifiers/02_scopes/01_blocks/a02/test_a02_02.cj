/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a02_02

  @Level:         1

  @Assertion:    3.2.1(2) Blocks are pervasive; for example, the bodies of function definitions, 
                 the two branches of if expressions, and the bodies of while loops are all blocks.

  @Description:  Check that the bodies of if_ expressions definitions are blocks.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

func myBoolFunc(i: Int64) {
    if (i > 0) {
        return false
    }
    return true
}

main() {
//  Test-case 1: consider block in if_part of an if_operator 
    
    let x01 : Float32 = 100.0
    var y01 : Float32 = 2.0 * x01
    
    if (x01 > 0.0) {
        var y01 : Float32 = 3.0 * x01
    }
    Assert.equals(200.0, y01)
    
//  Test-case 2: consider blocks in the if and else_parts of if_else_operators
    
    let x02 = 10
    var y02 : Int64 = 4 * x02
    
    if (myBoolFunc(0)) {
        var y02 : Int64 = 100
    }
    else {
        var y02 : Int64 = 500
    }
    Assert.equals(40, y02)

//   Test-case 3: consider empty block in the if_part of an if_else_operator 
    
    let x03 : Int32 = -100
    var y03 : Int32 = 6 * x03
    
    if (myBoolFunc(10)) { }
    else {
        var y03 : Int32 = 8 * x03
        y03 + 1
    }
    Assert.equals(-600, y03)

// Test-case 4: consider empty block in the else_part of an if_else_operator 
    
    let x04 = 100
    var y04  = 8 * x04
    
    if (myBoolFunc(0)) {
        var y04 = 7 * x04
        4 * x04 
    }
    else { }
    Assert.equals(800, y04)

//  Test-case 5: consider returning values of an if_else_operator 
    
    let x05 = 5
    var y05 : Int64 = 10 * x05
    
    var ifRes : Int64 = if (myBoolFunc(0)) {
        var y05 : Int64 = 3 * x05
        y05 + x05 
    }
    else {
        var y05 : Int64 = 5 * x05
        y05 - x05 
    }
    Assert.equals(20, ifRes)
}   //main


