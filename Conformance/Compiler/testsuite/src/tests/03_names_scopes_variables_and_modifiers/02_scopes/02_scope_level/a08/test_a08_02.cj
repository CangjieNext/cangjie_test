/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a08_02

  @Level:         1
  @Assertion:       3.2.2(8) For classes and interfaces, the name in this class is at a higher level of scope than the
                    name in the superclass. The name in a subclass may shadow or override the name in the superclass.

  @Description:     Check that the name of an overriden function or property in this class is at a higher level 
                    of scope than the name in the superclass or superinterface.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006086,0006133

*/

import utils.assert.Assert

open class SuperClass {
    public open func superClassF() { "SuperClass.superClassF" }

    public open prop superClassG: String {
        get() { "SuperClass.superClassG" }
    }
}

interface SuperInterface1 {
    func superInterface1F() { "SuperInterface1.superInterface1F" }

    prop superInterface1G: String {
        get() { "SuperInterface1.superInterface1G" }
    }
}

interface SuperInterface2 {
    func superInterface2F() { "SuperInterface2.superInterface2F" }

    prop superInterface2G: String {
        get() { "SuperInterface1.superInterface2G" }
    }
}

class C <: SuperClass & SuperInterface1 & SuperInterface2 {
    public override func superClassF() { "C.superClassF" }
    public override func superInterface1F() { "C.superInterface1F" }
    public override func superInterface2F() { "C.superInterface2F" }

    public override prop superClassG: String {
        get() { "C.superClassG" }
    }
    public override prop superInterface1G: String {
        get() { "C.superInterface1G" }
    }
    public override prop superInterface2G: String {
        get() { "C.superInterface2G" }
    }

    func test() {
        Assert.equals("C.superClassF", superClassF())
        Assert.equals("SuperClass.superClassF", super.superClassF())
        Assert.equals("C.superInterface1F", superInterface1F())
        Assert.equals("C.superInterface2F", superInterface2F())

        Assert.equals("C.superClassG", superClassG)
        Assert.equals("SuperClass.superClassG", super.superClassG)
        Assert.equals("C.superInterface1G", superInterface1G)
        Assert.equals("C.superInterface2G", superInterface2G)
    }
}

main() {
    C().test()
}
