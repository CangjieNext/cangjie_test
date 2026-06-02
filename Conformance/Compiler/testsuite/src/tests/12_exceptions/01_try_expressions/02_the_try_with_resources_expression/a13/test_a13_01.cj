/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a13_01

  @Level:         1

  @Assertion:    12.1.2(13) It should be noted that, when using try-with-resources expressions,
                            it is generally not necessary to include catch and finally blocks and we do not recommend
                            the user manually release resources, as all requested resources are automatically released
                            during the execution of the try block, regardless of whether an exception occurs,
                            and any exceptions thrown during execution are thrown outwards.

  @Description:  Checks that all resources requested for the try-with-resource expression are automatically released.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class MyException <: Exception {}

public class TestA1301 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        res_closed = true
    }
}

main() {
// test case #1
    let r1 = TestA1301()
    let e1 = try (r = r1) {}
    Assert.isTrue(r1.isClosed())

// test case #2
    var my_exception : Bool = false
    try {
        let r2 = TestA1301()
        let e2 = try (r = r2) {
            throw MyException()
        }
        Assert.isTrue(r2.isClosed())
    } catch (e: MyException) {
        my_exception = true
    }
    Assert.isTrue(my_exception, reason : "Expected MyException")
}
