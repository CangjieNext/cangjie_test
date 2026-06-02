/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a08_01

  @Level:         1
  @Assertion:       3.2.2(8) For classes and interfaces, the name in this class is at a higher level of scope than the
                    name in the superclass. The name in a subclass may shadow or override the name in the superclass.

  @Description:     Check that the name of an overriden function or property in this class is at a higher level 
                    of scope than the name in the superclass.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006086,0006133

*/

import utils.assert.Assert

open class Base {
    public open func f() { "Base" }

    public open prop g: Int64 {
        get() { 0 }
    }
}

class C <: Base {
    public override func f() { "C" }

    public override prop g: Int64 {
        get() { 1 }
    }

    func test() {
        Assert.equals("C", f())
        Assert.equals("Base", super.f())
        Assert.equals(1, g)
        Assert.equals(0, super.g)
    }
}

main() {
    C().test()
}
