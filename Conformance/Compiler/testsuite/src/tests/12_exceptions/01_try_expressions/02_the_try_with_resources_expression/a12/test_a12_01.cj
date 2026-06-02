/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a12_01

  @Level:         1

  @Assertion:    12.1.2(12) (2) if no exception is thrown in the block immediately after try,
                                the first exception thrown during the release will be thrown
                                (any subsequent exceptions thrown during the release will be ignored).

  @Description:  Checks how the exceptions thrown (or not) during execution of try block are handled.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class ReleaseException2 <: Exception {}
open class ReleaseException3 <: Exception {}
var res_counter = 0
public class TestA1201 <: Resource {
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

    TestA1201() {
        res_counter++
        res_number = res_counter
    }
}

main() {
    var releseException3 : Bool = false
    try {
        let e = try (r1 = TestA1201(),
                    r2 = TestA1201(),
                    r3 = TestA1201()) {}
    } catch (e: ReleaseException2) {
        Assert.fail(reason : "Only the first exception thrown during the release should be caught")
    } catch (e: ReleaseException3) {
        releseException3 = true
    }
    Assert.isTrue(releseException3, reason : "Expected ReleaseException3 thrown")
}
