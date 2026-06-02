/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_03

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that function names are expression which have type and
                value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var checkMe: Bool = false

func simpleFunction() { 
    checkMe = true 
}

func returnZero(): Int32 { 
    0 
}

func returnSingle(): Int32 { 
    1 
}

func returnString(str: String): String { 
    str 
}

func checkSimpleFunction(f: () -> Unit) { 
    f()
}

func checkInt32(f: () -> Int32) {
    f()
}

main() {
    Assert.isTrue(simpleFunction is () -> Unit)
    Assert.isTrue(returnZero is () -> Int32)
    Assert.isTrue(returnSingle is () -> Int32)
    Assert.isTrue(returnString is (String) -> String)
  
    checkSimpleFunction(simpleFunction)
    Assert.isTrue(checkMe)
    Assert.equals(0, checkInt32(returnZero))
    Assert.equals(1, checkInt32(returnSingle))

    Assert.equals("Hello", returnString("Hello"))
}
