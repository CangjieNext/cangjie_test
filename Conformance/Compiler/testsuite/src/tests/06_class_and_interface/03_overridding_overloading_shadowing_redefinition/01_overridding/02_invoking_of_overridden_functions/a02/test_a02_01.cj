/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_02_a02_01

  @Level:         1

  @Assertion: 6.3.1.2(2)
              In the following example, the function f is defined in the C1 ,
              f is overridden in the subclass C2, and the variables a and b of the C1 type are defined,
              assign the instance of C1(myC1) to a and the instance of C2(myC2) to b.
              When a and b are used to call the function f ,
              the corresponding function is selected based on their actual types at run time.
              open class C1 {
                open func f(): Unit {
                  return
                }
              }
              class C2 <: C1 {
                override func f(): Unit {
                  return
                }
              }
              var myC1 = C1()
              var myC2 = C2()
              // Assign the object of the superclass C1 to the variable of the C1 type.
              var a: C1 = myC1
              // Assign the object of the superclass C2 to the variable of the C1 type.
              var b: C1 = myC2
              // Invokes f of C1 based on the object type of at runtime
              var c = a.f()
              // Invokes f of C2 based on the object type of at runtime
              var d = b.f()

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006437

*/

import utils.assert.Assert

var C1_counter = 0
var C2_counter = 0

open class C1 {
    public open func f(): Unit {
        C1_counter++
        return
    }
}
class C2 <: C1 {
    public override func f(): Unit {
        Assert.equals(1, C1_counter)
        C2_counter++
        return
    }
}

var myC1 = C1()
var myC2 = C2()

// Assign the object of the superclass C1 to the variable of the C1 type.
var a: C1 = myC1
// Assign the object of the superclass C2 to the variable of the C1 type.
var b: C1 = myC2

// Invokes f of C1 based on the object type of at runtime
var c = a.f()
// Invokes f of C2 based on the object type of at runtime
var d = b.f()

main() {
    Assert.equals(1, C1_counter)
    Assert.equals(1, C2_counter)
}
