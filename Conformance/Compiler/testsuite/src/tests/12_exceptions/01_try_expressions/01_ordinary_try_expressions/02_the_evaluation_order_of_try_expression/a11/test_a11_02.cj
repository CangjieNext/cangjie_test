/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      12_01_01_02_a11_02

  @Level:         1

  @Assertion: 12.1.1.2(11) If any control transfer expression within the 
              finally block is executed, then the ones executed before 
              entering the finally block will not take effect. 
  @Description: Checks that `throw` expression executed before entering the 
                `finally` block will not take effect for the control transfer 
                expressions executed in the `finally` block. 
  @Mode: run 
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

class MyException <: Exception {
    var name = ""
    init(name: String) {
        this.name = name
    }
}

func checkThrowInTry() {
    // Case 1: Return in finally after throw in try
    func f1() : Int64 {
        try {
            throw Exception()
        } catch (_) {
        } finally {
            return 0
        }
        return -1
    }
    Assert.equals(0, f1())

    // Case 2: Throw in finally after throw in try
    func f2() {
        try {
            throw MyException("In try")
       } finally {
            throw MyException("In finally")
        }
    }
    var name = ""
    try {
        f2()
    } catch(e: MyException) {
        name = e.name
    }
    Assert.equals("In finally", name)

    // Case 3: Break in finally after throw in try
    func f3() : Int64 {
        var cnt = 0
        while (true) {
            if(cnt == 2) {
                try {
                    throw Exception()
                } catch (_) {
                } finally {
                    break
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(2, f3())

    // Case 4: Continue in finally after throw in try
    var cnt = 0
    while (cnt < 3) {
        cnt++
        try {
            throw Exception()
        } catch (_) {
        } finally {
            continue
        }
    }
    Assert.equals(3, cnt)
}

func checkThrowInCatch() {
    // Case 1: Return in finally after throw in catch
    func f1() : Int64 {
        try { 
            throw MyException("In try")
        } catch(_) {
        } finally {
            return 0
        }
        return -1
    }
    Assert.equals(0, f1())

    // Case 2: Throw in finally after throw in catch
    func f2() {
        try {
            throw MyException("In try")
       } catch (_) {
       } finally {
            throw MyException("In finally")
        }
        return 1
    }
    var ret = -1
    var name = ""
    try {
        f2()
    } catch(e: MyException) {
        name = e.name
    }
    Assert.equals(-1, ret)    
    Assert.equals("In finally", name)

    // Case 3: Break in finally after throw in catch
    func f3() : Int64 {
        var cnt = 0
        while (true) {
            if(cnt == 2) {
                try {
                    throw MyException("In try")
                } catch (_) {
                } finally {
                    break
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(2, f3())

    // Case 4: Continue in finally after throw in catch
    var cnt = 0
    while (cnt < 3) {
        cnt++
        try {
            throw MyException("In try")
        } catch (_) {
        } finally {
            continue
        }
    }
    Assert.equals(3, cnt)
}

main() {
    checkThrowInTry()
    checkThrowInCatch()
 }

