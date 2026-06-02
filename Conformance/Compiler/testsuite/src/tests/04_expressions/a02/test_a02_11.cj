/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_11

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that spawn and synchronized are expressions and have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

  @Issue: 0006081

*/

import std.sync.*        
import utils.assert.Assert

let mutex = Mutex()
var cnt = 0

func foo(): Future<Unit> {
    return spawn {
        var unit = synchronized(mutex) { 
            cnt++ 
        }
        Assert.equals(1, cnt)
        Assert.isTrue(unit is Unit)
        if(() != unit) { 
            Assert.fail(reason: "Unit should have value ()") 
        }  
    }
}

main() {
    // Check spawn
    let s = spawn { 
        true 
    } 
    Assert.isTrue(s is Future<Bool>)
    try { 
        Assert.isTrue(s.get())
    } catch (_) {
        Assert.fail(reason: "Should not be here")
    } 

    // Check synchronized
    var t = foo()
    var res = t.get()
    Assert.equals(1, cnt)
}
