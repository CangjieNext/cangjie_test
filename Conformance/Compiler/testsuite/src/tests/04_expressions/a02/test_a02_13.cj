/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_13

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that postfix expressions have a type and a value.
                Tests member access, function invocation, index access, question mark.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let arr : Array<UInt8>  = [72, 101, 108, 108, 111]

open class C {
    public let name: String = "C";
    open public func getId(): Int32 { 
        1 
    }
} 

func checkFunctionName(f: () -> Int32) {
    Assert.equals(1, f())
}
 
func simple(i: Int32): Bool { 
    if(i == 0) { 
        true 
    } else { 
        false 
    }
}

main() {
    let c: C = C()

    // Check Member Access:
    Assert.isTrue(c.name is String)
    Assert.equals("C", c.name)
    Assert.isTrue(c.getId is (() -> Int32))
    checkFunctionName(c.getId)

    // Check Function Invocation:
    Assert.isTrue(simple(1) is Bool)
    Assert.isTrue(simple(0))
    Assert.isFalse(simple(1))

    // Check Index Access:
    Assert.isTrue(arr[1] is UInt8)
    Assert.equals(101, arr[1])

    // Check Question Mark:
    let c1 = Some(c)
    Assert.isTrue(c1?.name is Option<String>)
    let x = match (c1?.name) {
        case c1 => 0 
    }
    Assert.equals(0, x)
}
