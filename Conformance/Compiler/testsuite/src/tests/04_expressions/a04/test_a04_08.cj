/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_08

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that `this`, `super` and type check can be a part of the
                composite expression. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class C1 {
    open public func verifyMe() {
        var v1 = (this.getId() + this.getId()) * 10
        Assert.isTrue(v1 is Int32)
        Assert.equals(20, v1)

        var v2 = "Hello:" + this.getName() + this.getName()
        Assert.isTrue(v2 is String)
        Assert.equals("Hello:C1C1", v2)

        var v3 = (this is C1) && (this.getName() is String) && (this.getId() is Int32)
        Assert.isTrue(v3 is Bool)
        Assert.isTrue(v3)
    }

    open public func getName(): String { 
        "C1"
    }
  
    open public func getId(): Int32 { 
        1 
    }
} 

open class C2 <: C1 {
    override open public func verifyMe() {
        var v1 = (this.getId() + super.getId()) * 10
        Assert.isTrue(v1 is Int32)
        Assert.equals(30, v1)

        var v2 = "Hello:" + this.getName() + super.getName()
        Assert.isTrue(v2 is String)
        Assert.equals("Hello:C2C1", v2)

        var v3 = ((this is C2) && 
                (this.getName() is String) && 
                (this.getId() is Int32)) &&
                ((this is C1) && (super.getName() is String) && (super.getId() is Int32))
        Assert.isTrue(v3 is Bool)
        Assert.isTrue(v3)
    }

    override open public func getName(): String { 
        "C2"
    }

    override open public func getId(): Int32 { 
        2 
    }
}

class C3 <: C2 {
    override public func verifyMe() {
        var v1 = (this.getId() + super.getId()) * 10
        Assert.isTrue(v1 is Int32)
        Assert.equals(50, v1)

        var v2 = "Hello:" + this.getName() + super.getName()
        Assert.isTrue(v2 is String)
        Assert.equals("Hello:C3C2", v2)

        var v3 = ((this is C3) && 
                    (this.getName() is String) && 
                    (this.getId() is Int32)) &&
                ((this is C2) &&
                    (this is C1) &&
                    (super.getName() is String) && 
                    (super.getId() is Int32))
        Assert.isTrue(v3)
    }

    override public func getName(): String { 
        "C3"
    }

    override public func getId(): Int32 { 
        3 
    }
}

main() {
    C1().verifyMe()
    C2().verifyMe()
    C3().verifyMe()
}
