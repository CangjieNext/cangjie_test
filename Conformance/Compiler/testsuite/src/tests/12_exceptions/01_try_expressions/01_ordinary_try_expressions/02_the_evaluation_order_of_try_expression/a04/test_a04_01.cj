/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      12_01_01_02_a04_01

  @Level:         1

  @Assertion: 12.1.1.2(4) If there is no return (or throw expression) in the
              finally block, the cached result v will be returned (or an 
              exception will be thrown) after the finally block is processed.
  @Description: Checks that cached result will be returned or Exception thrown 
                when try expression contains the return or throw expression. 
  @Mode: 	 run        
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

class MyException <: Exception {
    var name = ""
    init(name: String) {
        this.name = name
    }
}

main() {   
    // test case #1: check return in try
    var v1 = 1
    func foo1() {
        try {
            return v1 * 10
        } finally {
            Assert.equals(1, v1)
            v1 = -1
        }
    }
    var v = foo1() 
    Assert.equals(-1, v1)
    Assert.equals(10, v)

    // test case #2: check throw in try
    var v2 = "Thrown"
    func foo2() {
        try {
            throw MyException(v2)
        } finally {
            Assert.equals("Thrown", v2)
            v2 = "Finally"
        }
    }
    try {
        foo2()
    } catch (e: MyException) {
        Assert.equals("Finally", v2)
        Assert.equals("Thrown", e.name)
    }

    // test case #3: check return in catch
    var v3 = 2
    func foo3() {
        try {
            throw MyException("In try")
        } catch (_) {
            return v3 * 10
        } finally {
            Assert.equals(2, v3)
            v3 = -1
        }
    }
    v = foo3() 
    Assert.equals(-1, v3)
    Assert.equals(20, v)

    // test case #4: check throw in catch
    var v4 = "Thrown"
    func foo4() {
        try {
            throw MyException("In try")
        } catch (_) {
            throw MyException(v4)
        } finally {
            Assert.equals("Thrown", v4)
            v4 = "Finally"
        }
    }
    try {
        foo4()
    } catch (e: MyException) {
        Assert.equals("Finally", v4)
        Assert.equals("Thrown", e.name)
    }

    return
}
