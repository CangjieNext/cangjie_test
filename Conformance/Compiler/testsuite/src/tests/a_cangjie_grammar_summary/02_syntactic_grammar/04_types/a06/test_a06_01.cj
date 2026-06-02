/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a06_01

  @Level:         1
  @Assertion:   A.2.4(6)
                charLangTypes
                    : numericTypes
                    | CHAR
                    | BOOLEAN
                    | Nothing
                    | UNIT
                    | THISTYPE
                    ;
  @Description: Check THISTYPE type
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

open class Class1{
    func get_this() {
        return this
    }
    func get_this2(): This {
        return this
    }
    public open func get_this3(): Class1 {
        return this
    }
}
main() {
    var c = Class1()
    Assert.isTrue(c is Class1)
    Assert.isTrue(c.get_this() is Class1)
    Assert.isTrue(c.get_this2() is Class1)
    Assert.isTrue(c.get_this3() is Class1)
    return 0
}
