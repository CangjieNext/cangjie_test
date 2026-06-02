/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a02_03

  @Level:         1

  @Assertion:    3.2.1(2) Blocks are pervasive; for example, the bodies of function definitions, 
                 the two branches of if expressions, and the bodies of while loops are all blocks.

  @Description:  Check that the bodies of loops are blocks.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

main() {

//  Test-case 1: consider block in the body of a while loop (new scopes)
    var whileLoopCount = 10
    var outScope01 = -5
    while (whileLoopCount > 0) {
        whileLoopCount--; 
        var outScope01 = whileLoopCount; 
        outScope01++; 
    }
    Assert.equals(-5, outScope01)

//  Test-case 2: consider block in the body of a doOH_while loop (new scopes)
    var doLoopCount = 20
    var outScope02 = -50
    do {
        doLoopCount--; 
        var outScope02 = doLoopCount; 
        outScope02++; 
    }
    while (doLoopCount > 0) 
    Assert.equals(-50, outScope02)

//  Test-case 3: consider block in the body of a for-in loop with a range (new scopes)
    
    let evenRange03 = 10..=20:2    
    var outScope03 = 5
    var inScope03 = 0
    
    for (value in evenRange03 ) {
        var outScope03 = value; 
        outScope03++ 
        inScope03 += value
    }
    Assert.equals(5, outScope03)

//  Test-case 4: consider block in the body of a for-in-where loop with a range (new scopes)
    let evenRange04 = 10..=20:2    
    var outScope04 = 5
    var inScope04 = 0
    
    for (value in evenRange04 where value %3 == 0) {
        var outScope04 = value; 
        outScope04++ 
        inScope04 += value
    }
    Assert.equals(5, outScope04)

//  Test-case 5: consider block in the body of a for-in loop with an integer array (new scopes)
    
    let intArray: Array<Int32> = [0, 1, 2, 3, 4, 5, 6, 7, 8 , 9, 10]    
    var outScope05 = -5
    var inScope05 = intArray[0]
    
    for (value in intArray ) {
        var outScope05 = value; 
        outScope05++ 
        inScope05 += value
    }
    Assert.equals(-5, outScope05)
}   //main

