/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a11_01

  @Level:         1

  @Assertion:    12.1.2(11) In the process of releasing resources, if an exception is thrown
                            when a resource is released, it does not affect the release of other resources,
                            and the exceptions thrown by the entire try expression conform to the following principles:
                            (1) if an exception is thrown in the block immediately following try, the exception thrown
                                during the release of the resource is suppressed;

  @Description:  Checks how the exception thrown during execution of try block is handled.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
open class ReleaseException2 <: Exception {}
open class ReleaseException3 <: ReleaseException2 {}
var res_counter = 0
public class TestA1101 <: Resource {
    var res_number = 0
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        if (res_number == 1) {
            res_closed = true
        }
        if (res_number == 2) {
            throw ReleaseException2()
        }
        if (res_number == 3) {
            throw ReleaseException3()
        }
    }

    TestA1101() {
        res_counter++
        res_number = res_counter
    }
}

main() {
    var res1 : Resource = TestA1101()
    var res2 : Resource = TestA1101()
    var res3 : Resource = TestA1101()

    var my_exception : Bool = false
    try {
        try (r1 = res1,
            r2 = res2,
            r3 = res3) {
                throw MyException()
            }
    } catch (e: ReleaseException2) {
        Assert.fail(reason : "All exceptions occurs during the release process should be suppressed.")
    } catch (e: MyException) {
        my_exception = true
    }
    Assert.isTrue(my_exception, reason : "Expected MyException.")
    Assert.equals(3, res_counter)
    Assert.isTrue(res1.isClosed())
    Assert.isFalse(res2.isClosed())
    Assert.isFalse(res3.isClosed())
}
