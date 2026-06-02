/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a04_03

  @Level:         1

  @Assertion: 6.2.4.1(4)
              The return type of the implemented function should be the same as
              or a subtype of the return type of the corresponding function in the interface.

  @Description: Check that a class can implement abstract functions from a superinterface
                by defining functions with the same name, parameter list and the return type
                that is a subtype of an abstract function return type.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class Top {}
open class Middle <: Top {}
class Bottom <: Middle {}
type X1 = Top
type X2 = Middle
type X3 = Bottom

interface I3 {
    func f1(): Top
    func f2(): Top
    func f3(): Top
    func f4(): Top
    func f5(): Top
    func f6(): Top
}

class C <: I3 {
    public func f1(): Top {
        return Top()
    }
    public func f2(): Middle {
        return Middle()
    }
    public func f3(): Bottom {
        return Bottom()
    }
    public func f4(): X1 {
        return X1()
    }
    public func f5(): X2 {
        return X2()
    }
    public func f6(): X3 {
        return X3()
    }

    func check() {
        Assert.isTrue(f1() is Top)
        Assert.isTrue(f2() is Middle)
        Assert.isTrue(f3() is Bottom)
        Assert.isTrue(f4() is Top)
        Assert.isTrue(f5() is Middle)
        Assert.isTrue(f6() is Bottom)
    }
}

main() {
    C().check()
}