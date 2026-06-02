/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_03_a01_01

  @Level:         1

  @Assertion:    11.1.3.3(1) The syntax import packageName.* is used to import all top-level 
                 definitions or declarations in packageName. 
 
  @Description:  Check that syntax import packageName.* is used to import all top-level 
                 definitions or declarations

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj
 
*/

package p2
import p1.*
import utils.assert.Assert

main() {
    Assert.equals(1, a1)
    Assert.equals(2023, a2)
    Assert.equals(2023, a3)
    Assert.equals(2023, a4)
    Assert.equals(2023, a5)
    Assert.equals(2023, a6)
    Assert.equals(2023, a7)
    Assert.equals(2023, a8)
    Assert.equals(2023, a9)
    Assert.equals(20.23, a10)
    Assert.equals(20.23, a11)
    Assert.equals(20.23, a12)

    Assert.equals(r'c', c1)
    Assert.equals(r'\u{2023}', c2)

    Assert.equals("string", s1)
    Assert.equals("          This is a multi-line string", s2)

    var a :Int8 = 0
    for (val in r1) {
        Assert.equals(a, val)
        a++
    }

    Assert.equals(0, arr1[0])
    Assert.equals(1, arr1[1])
    Assert.equals(2, arr1[2])
    
    Assert.isTrue(b1)

    Assert.equals("foo", f1())

    Assert.equals("S1", S1.structName)

    var e2: E1 = First(0.0)
    let whichVal = match(e2) {
        case First(p1) => "first"
        case Second(p1, p2) => "second"
    }
    Assert.equals("first", whichVal)

    Assert.equals(10, C1.add(5, 5))

    return 0
}

