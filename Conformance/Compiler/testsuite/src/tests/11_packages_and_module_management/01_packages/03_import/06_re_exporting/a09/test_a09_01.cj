/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a09_01

  @Level:         1

  @Assertion:    11.1.3.6(9) Since the name imported with public import is equivalent to defining a 
                 new name in this package, the name imported by public import have the same rules 
                 with the name renamed by import as,  that is, the scope level of the name imported 
                 by public import is consistent with the top level of the current package, and if the 
                 imported definition or declaration is function type,  the imported name will still 
                 participate in function overloading. 

  @Description:  Check that re-exported content can participate in function overloading, shadowing and has same 
                 scope level as top level declarations of the current package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a09_02.cj

*/

package pkg1
import pkga2.*
import pkga2.C2
import utils.assert.Assert

public func foo1() {
    return "foo1 from p1"
}

public func sum(p1: Int64, p2: Int64) {
    return p1 + p2
}

class C3 {
    static var num = 3.14
}

main() {
    Assert.equals(3.14, C3.num) 

    Assert.equals("foo1 from p1", foo1())  //foo1 shadowed

    Assert.equals(2023, sum(2000, 23)) 
    Assert.equals(20.23, sum(20.00, 0.23)) // sum overloaded
}