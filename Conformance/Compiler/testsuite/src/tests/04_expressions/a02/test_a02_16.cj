/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_16

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that type check expressions have type and value.
                Tests as and is.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

open class C1 {} 
open class C2 <: C1 {}
class C3 <: C2 {}

let c1: C1 = C1();
let c2: C2 = C2();
let c3: C3 = C3();

func checkAs() {
    Assert.isTrue((c2 as C1) is Option<C1>)
    let m1 = match ((c2 as C1)) { 
        case c1 => 1 
    }
    Assert.isTrue(m1 is Int64)

    Assert.isTrue((c3 as C1) is Option<C1>)
    let m2 = match ((c3 as C1)) { 
        case c1 => 1 
    }
    Assert.isTrue(m2 is Int64)
}

func checkIs() {
    Assert.isTrue((c3 is C1) is Bool)
    Assert.isTrue(c3 is C1)
}

main() {
    checkAs()
    checkIs()
}