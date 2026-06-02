/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_01_a03_01

  @Level:         1

  @Assertion:    3.2.1(3) Blocks introduce new scopes.

  @Description:  Check that declaration of variables in blocks introduces a new variable with the same name.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

func foo01(a: Int64) { 
    var y01 : Int64 = a * 10
}

func myBoolFunc(i: Int64){
    if(i > 0){
        return false
    }
    return true
}

main() {

//  Test-case 1: check introducing new scopes in a function body
    
    let y01: Int64 = 100
    foo01(y01)
    Assert.equals(100, y01)

//  Test-case 2: check introducing a new scope in if blocks
    
    let x02 = 100
    var y02 : Int64 = 2 * x02
    if (myBoolFunc(0)) {
        var y02 : Int64 = 3 * x02
    }
    else {
        var y02 : Int64 = -1000
    }
    Assert.equals(200, y02)
    
//  Test-case 3: check introducing a new scope in else blocks
    
    let x03 = -100
    var y03 : Int64 = 3 * x03
    
    if (myBoolFunc(1)) {
        var y03 : Int64 = 1000
    }
    else {
        var y03 : Int64 = 4 * x03
    }
    Assert.equals(-300, y03)

//  Test-case 4: check introducing a new scope in internal functions
    
func foo04(a: Int32, b: Int32): Int32 { 
    let c : Int32 = 100
    var y04 : Int32 = (a + b) * c 
    return y04 + c 
}    
    var y04 : Int64 = 100
    let a32 : Int32 = 10
    let b32 : Int32 = 20
    y04 += Int64(foo04(a32, b32))
    Assert.equals(3200, y04)
    
//  Test-case 5: check introducing a new scope in a lambda block

    var extra : Int64 = 100;
    var blockRes05 = { => var extra : Int64 = 10; extra - 100 }() 
    blockRes05 += extra;
    Assert.equals(10, blockRes05)
    
}   //main


