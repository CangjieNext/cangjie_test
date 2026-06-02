/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_28

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Test this and super, member access expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

open class C1 {
    open public func getName(): String { 
        "C1" 
    }
}

open class C2 <: C1 {
    override open public func getName(): String { 
        "C2" 
    }

    open public func getSuperName(): String { 
        super.getName() 
    }
}

class C3 <: C2 {
    public func checkMe() {
        Assert.isTrue((this.getName() + super.getName() + super.getSuperName()) is String)
        Assert.equals("C3C2C1", getName() + super.getName() + super.getSuperName())
    }

    override public func getName(): String { 
        "C3" 
    }
}

main() {
    C3().checkMe()  
}
