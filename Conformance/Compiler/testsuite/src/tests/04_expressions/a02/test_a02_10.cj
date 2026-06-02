/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_10

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that this and super are expressions and have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

open class C1 {
    open public func verifyMe() {
        Assert.isTrue(this is C1)
        Assert.equals(1, this.getId())
    }

    open public func superVerify(): String { 
        Assert.isTrue(this is C1)
        "C1"
    }
  
    open public func getId(): Int32 { 
        1 
    }
} 

open class C2 <: C1 {
    override open public func verifyMe() {
        Assert.isTrue(this is C2)
        Assert.equals(2, this.getId())
    
        // super only can be on the left-hans side of a dot, 
        // so cannot check it type and value directly
        Assert.equals("C1", super.superVerify())
    }

    override open public func superVerify(): String { 
        Assert.isTrue(this is C2)
        "C2"
    }

    override open public func getId(): Int32 { 
        2 
    }
}

class C3 <: C2 {
    override public func verifyMe() {
        Assert.isTrue(this is C3)
        Assert.equals(3, this.getId())

        // super can be on the left-hans side of a dot, 
        // so cannot check it type and value directly.
        Assert.equals("C2", super.superVerify())
    }

    override public func superVerify(): String { 
        Assert.isTrue(this is C3)
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
