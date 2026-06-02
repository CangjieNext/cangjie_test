/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a10_01

  @Level:         1

  @Assertion:    12.1.2(10) During the execution of the block, whether or not an exception is thrown,
                            the resources are then automatically released in the reverse order
                            in which they were requested (in the above example,
                            the output object is released first, then the input object).

  @Description:  Checks that all requested resources are released in the reverse order.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
var res_number = 0
var released_sequence : String = ""

public class TestA1001 <: Resource {
    var res_closed : Bool = false
    var res_num = 0
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        released_sequence = released_sequence + res_num.toString() + " "
        res_closed = true
    }

    TestA1001() {
        res_number++
        res_num = res_number
    }
}

main() {
// test case #1
    try (r1 = TestA1001(),
        r2 = TestA1001(),
        r3 = TestA1001()) {}
    Assert.equals("3 2 1 ", released_sequence)

// test case #2
    res_number = 0
    released_sequence = ""
    try {
        try (r1 = TestA1001(),
            r2 = TestA1001(),
            r3 = TestA1001()) {
            throw Exception()
        }
    } catch (_) {}
    Assert.equals("3 2 1 ", released_sequence)
}
