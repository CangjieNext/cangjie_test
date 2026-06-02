/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a11_01

  @Level:         1

  @Assertion:    12.1.1(11) Finally blocks are mainly designed for clean-up works, e.g., releasing resources.
                            Moreover, throwing exceptions in the finally block is not recommended.

  @Description:  Checks that the finally blocks releases resources when an exception occurs or does not.

  @Mode:         run        

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

var resClosed : Bool = false

public class TestA1101 <: Resource {
    public func isClosed() : Bool {
        return false
    }
    public func close() : Unit {
        resClosed = true
    }
}

open class MyException <: Exception {}
open class MyClass {
    func close() : Bool {
        return true
    }
}
main() {
    var myClass : MyClass = MyClass()
// test case #1
    try {
    } catch (_) {
    } finally {
        Assert.equals(true, myClass.close())
    }
// test case #2
    myClass = MyClass()
    try {
        throw MyException()
    } catch (_) {
    } finally {
        Assert.equals(true, myClass.close())
    }
// test case #3
    resClosed = false
    try (r = TestA1101()) {
    } catch (_) {
    } finally {
        Assert.equals(true, resClosed)
    }
// test case #4
    resClosed = false
    try (r = TestA1101()) {
        throw MyException()
    } catch (_) {
    } finally {
        Assert.equals(true, resClosed)
    }
// test case #5
    try {
        try (r = TestA1101()) {
        } finally {
            throw MyException()
        }
    } catch (e: MyException) {
        print("It's not recommended throwing the exception in the finally block although it is caught correctly.")
    }
}
