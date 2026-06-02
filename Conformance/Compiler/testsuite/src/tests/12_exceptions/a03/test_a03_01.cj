/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_a03_01

  @Level:         1
  @Assertion:   12 (3) Exceptions are abnormal behaviors of the program. Once 
                an exception is thrown, the program must handle it immediately.
                That is to say, the control flow of the program is transferred
                from where the execution occurs to where the exception is
                caught and handled. The Cangjie programming language provides 
                an exception handling mechanism to handle exceptions that may 
                occur at run-time. 
  @Description: Checks that the control flow is transferred to the catch-block 
                immediatelly when any exception is thrown.  
  @Mode:        run         
  @Negative:    no     
  @Structure:   single

*/

import utils.assert.Assert

class Res <: Resource {
    public func isClosed(): Bool {
        return true
    }

    public func close() {}
}

main(ina: Array<String>) {
    let rtz : Bool = Assert.getRuntimeZero(ina) == 0
    var exception_caught : Bool = false
    
    // test case #1
    try {
        if (rtz) {
            throw Exception()
        }
        Assert.fail(reason: "Should not reach here")
    } catch (_) {
        exception_caught = true
    } finally {}
    Assert.isTrue(exception_caught)

    // test case #2
    exception_caught = false
    try (r = Res()) {
        if (rtz) {
            throw IndexOutOfBoundsException()
        }
        Assert.fail(reason: "Should not reach here")
    } catch (_) {
        exception_caught = true
    }
    Assert.isTrue(exception_caught)

    // test case #3
    var num : Int64 = 3
    exception_caught = false
    try {
        while (num >= 1) {
            num-- 
            let res = 1 / num
        }
        Assert.fail(reason: "Should not reach here")
    } catch (e: ArithmeticException) {
        exception_caught = true
    } catch (_) {
        Assert.fail(reason: "Should not reach here")
    } finally {}
    Assert.isTrue(exception_caught)

    // test case #4
    exception_caught = false
    try (r = Res()) {
        let arr = [0, 1, 2]
        for (ind in [0, 1, 2, 3]) {
            let elem = arr[ind]
        }
        Assert.fail(reason: "Should not reach here")
    } catch (e: IndexOutOfBoundsException) {
        exception_caught = true
    } catch (_) {
        Assert.fail(reason: "Should not reach here")
    } finally {}
    Assert.isTrue(exception_caught)
}
