/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_03_03_a02_01

  @Level:         1

  @Assertion:   11.1.3.3(2)
    package p1 
    // a.cj 
    public class C1 {...} 
    public func foo() {...} 

    // b.cj 
    package p2 
    import p1.*           // import all top-level type declarations in package p1. 

    var obj = C1() 
    var result = foo() 

 
  @Description:  Check that code sample

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: a.cj
 
*/

package p2 
import p1.*           // import all top-level type declarations in package p1. 
import utils.assert.Assert

var obj = A() 
var result = foo() 

main() {
    Assert.equals("foo", result)
    Assert.equals("C1", obj.className)
    return 0
}