/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a15_01

  @Level:         1

  @Assertion: 6.1.2.4(15)
              They are independent of objects.

  @Description: Check that static member functions can be called
                before creation of any isntances of the class,
                after creating instances of the class
                and after modifications of instances of the class,
                all without effect on the invocation or execution of static functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: 'They' means static member functions

*/

import utils.assert.Assert

var global = 17
let gl_val = ""
let res_val = "_"

class Test {
    static func f1() {
        if (global > 0) {
            return res_val
        } else {
            return gl_val
        }
    }
    static func f2<T>() {
        if (global > 0) {
            return res_val
        } else {
            return gl_val
        }
    }
    static func f3(x: Int64) {
        if (global > 0) {
            return res_val
        } else {
            return gl_val
        }
    }
    static func f4<T>(x: T) {
        if (global > 0) {
            return res_val
        } else {
            return gl_val
        }
    }
    static func f5(a: String, b: Rune) {
        if (global > 0) {
            return res_val
        } else {
            return gl_val
        }
    }

    // Check execution inside an object
    func test() {
        Assert.equals("_", f1())
        Assert.equals("_", f2<Bool>())
        Assert.equals("_", f3(13))
        Assert.equals("_", f4<String>("Sfqjl"))
        Assert.equals("_", f5("", r'k'))
    }
}

main() {
    Assert.equals("_", Test.f1())
    Assert.equals("_", Test.f2<Bool>())
    Assert.equals("_", Test.f3(13))
    Assert.equals("_", Test.f4<String>("Sfqjl"))
    Assert.equals("_", Test.f5("", r'k'))

    var obj = Test()
    Assert.equals("_", Test.f1())
    Assert.equals("_", Test.f2<Bool>())
    Assert.equals("_", Test.f3(13))
    Assert.equals("_", Test.f4<String>("Sfqjl"))
    Assert.equals("_", Test.f5("", r'k'))

    obj.test()

    obj = Test()
    Assert.equals("_", Test.f1())
    Assert.equals("_", Test.f2<Bool>())
    Assert.equals("_", Test.f3(13))
    Assert.equals("_", Test.f4<String>("Sfqjl"))
    Assert.equals("_", Test.f5("", r'k'))
    obj.test()
}