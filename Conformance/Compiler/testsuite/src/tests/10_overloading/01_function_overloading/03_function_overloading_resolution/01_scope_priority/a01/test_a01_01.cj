/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a01_01

  @Level:         1

  @Assertion:    10.1.3.1(1) If two functions in the candidate set have 
                 different scope levels, the function with the higher 
                 scope level is selected when the function is overloaded
  
  @Description:  Scopes in classes

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert


open class Parent {   
    public func Check(arg:Sub) {
    }
}

open class Sub <: Parent {
    public func Check(arg:Parent) {
        Assert.fail()
    }
}

main(ina :Array<String>) {
    var o:Sub = Sub()
    o.Check(Sub())
    try {
        o.Check(Parent())
    } catch (_) {
    } finally {
        return 0
    }
    0
}

