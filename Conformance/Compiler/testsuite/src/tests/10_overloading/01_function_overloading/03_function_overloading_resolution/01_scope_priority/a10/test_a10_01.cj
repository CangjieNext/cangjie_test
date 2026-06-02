/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a10_01

  @Level:         1

  @Assertion:    10.1.3.1(10) In the following example,
                 the scope priority of function f defined 
                 in class C is the same as the function f 
                 defined in an extension of C 
                 when the functions are overloaded.
    open class Base {}
    class Sub <: Base {}
    class C {
         func f(a: Sub): Unit {}       // f1
    }
    extend C {
        func f(a: Base): Unit {}      // f2
        func g() {
             f(Sub()) // f1
        }
    }
    var obj = C()
    var x = obj.f(Sub()) // f1
 
  
  @Description:  Example with Father-Child classes taken form spec.
                 Enriched with asserts
  
  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Base {}
class Sub <: Base {}
class C {
    func f(a: Sub): Unit {
    }       // f1
}
extend C {
    func f(a: Base): Unit {
        Assert.fail()
    }      // f2
    func g() {
         f(Sub()) // f1
    }
}


main(ina :Array<String>) {
    var obj = C()
    var x = obj.f(Sub()) // f1

    0
}
