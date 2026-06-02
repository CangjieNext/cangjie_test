/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_09

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that `spawn` and `synchronized` can ba a part of the 
                composite expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

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

        let s = spawn { 
            true 
        } 
        Assert.isTrue(s is Future<Bool>)
        try { 
            Assert.isTrue(s.get())
        } catch (_) {
            Assert.fail(reason: "Should not reach here")
        } 
    }
}

main() {
    var t = foo()
    Assert.isTrue(t is Future<Unit>)
    var res = t.get()
    Assert.equals(1, cnt)
}
