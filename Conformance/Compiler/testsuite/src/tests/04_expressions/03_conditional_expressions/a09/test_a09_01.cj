/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_03_a09_01

  @Level:         1

  @Assertion:   4.3(9) An example of a basic if-letexpression.
                
                main() :Int64 {
                    let x:Option <Int64 >=Option <Int64 >.Some(100)
                    // if-let expression without else branch
                    if (let Some(v) <- x) {
                        print( "x has value" )
                    }
                 
                    // if-let expression with else branch
                    if (let Some(v) <- x) {
                        print( "x has value" )
                    }else {
                        print( "x has not value" )
                    }
                 
                    return 0
                }

  @Description:  Check if-let expression example.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006130
  
*/

import utils.assert.Assert

main() : Int64 {
    let x: Option<Int64> = Option <Int64>.Some(100)
    // if-let expression without else branch
    if (let Some(v) <- x) {
        print( "x has value")
    }
    
    // if-let expression with else branch
    if (let Some(v) <- x) {
        print( "x has value")
    } else {
        print( "x has not value")
        Assert.fail(reason: "x has not value") 
    }
    
    return 0
}
