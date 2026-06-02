/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      12_01_01_02_a11_04

  @Level:         1

  @Assertion: 12.1.1.2(11) If any control transfer expression within the 
              finally block is executed, then the ones executed before 
              entering the finally block will not take effect. 
  @Description: Checks that `continue` expression executed before entering the
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

func checkBreakInTry() {
    // Case 1: Return in finally after continue in try
    func f1() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    continue
                } finally {
                    return 20
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(20, f1())

    // Case 2: Throw in finally after continue in try
    func f2() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    continue
                } finally {
                    throw MyException("In finally")
                }
            }
            cnt++
        }
        return cnt
    }
    var ret = -1
    var name = ""
    try {
        ret = f2()
    } catch(e: MyException) {
        name = e.name
    }
    Assert.equals(-1, ret)
    Assert.equals("In finally", name)

    // Case 3: Break in finally after continue in try
    func f3() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    continue
                } finally {
                    break
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(2, f3())

    // Case 4: Continue in finally after continue in try
    func f4() : Int64 {
        var cnt = 0
        while (cnt < 3) {
            cnt++
            try {
                continue
            } finally {
                continue
            }
        }
        return cnt
    }
    Assert.equals(3, f4())   
}

func checkBreakInCatch() {
        // Case 1: Return in finally after continue in catch
    func f1() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    throw Exception() 
                } catch(_) {
                    continue
                } finally {
                    return 20
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(20, f1())

    // Case 2: Throw in finally after continue in catch
    func f2() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    throw MyException("In try")
                } catch (_) {
                    continue
                } finally {
                    throw MyException("In finally")
                }
            }
            cnt++
        }
        return cnt
    }
    var ret = -1
    var name = ""
    try {
        ret = f2()
    } catch(e: MyException) {
        name = e.name
    }
    Assert.equals(-1, ret)
    Assert.equals("In finally", name)

    // Case 3: Break in finally after continue in catch
    func f3() : Int64 {
        var cnt = 0
        for (i in [1, 2, 3, 4]) {
            if (i == 3) {
                try {
                    throw Exception()
                } catch (_) {
                    continue
                } finally {
                    break
                }
            }
            cnt++
        }
        return cnt
    }
    Assert.equals(2, f3())

    // Case 4: Continue in finally after continue in catch
    func f4() : Int64 {
        var cnt = 0
        while (cnt < 3) {
            cnt++
            try {
                throw Exception() 
            } catch (_) {
                continue
            } finally {
                continue
            }
        }
        return cnt
    }
    Assert.equals(3, f4())   
}

main() {
    checkBreakInTry()
    checkBreakInCatch()
 }
