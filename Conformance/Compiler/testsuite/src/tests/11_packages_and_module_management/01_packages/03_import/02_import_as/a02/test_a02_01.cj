/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_02_a02_01

  @Level:         1

  @Assertion:    11.1.3.2(2)
    // a.cj 
    package p1 

    public func foo() {...} 

    // c.cj 
    package p2 

    import p1.foo as f1        // rename foo defined in p1 as f1 

    func foo() {...} 

    var result1 = f1() 

    var result2 = foo() 
    
  @Description:  Check code sample

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: a.cj
 
*/
package p2 

import p1.foo as f1        // rename foo defined in p1 as f1 
import utils.assert.Assert

func foo() {
    return "p2 foo"
} 

var result1 = f1() 

var result2 = foo() 

main() {
    Assert.equals("p1 foo", result1)
    Assert.equals("p2 foo", result2)
}


