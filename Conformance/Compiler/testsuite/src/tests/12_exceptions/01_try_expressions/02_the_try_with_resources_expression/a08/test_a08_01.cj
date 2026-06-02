/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a08_01

  @Level:         1

  @Assertion:    12.1.2(8) The try-with-resources expression first instantiates (in declarative order)
                           the corresponding set of resource requests (in the above example,
                           the input object is instantiated first, followed by the output object),
                           during which if a resource request fails (e.g. the output instantiation fails),
                           all the resources that were successfully requested before it (e.g., the input object)
                           are released  (any exceptions thrown during the release process are suppressed)
                           and an exception is thrown for the failure to request this resource (output). 


  @Description:  Checks how the resources are released when there is some failures during instantiating the resources. 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
open class ReleaseException <: Exception {}
var res_number = 0
var request_sequence : String = ""
public class TestA0801 <: Resource {
    var res_closed : Bool = false
    var res_num = 0
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        if (res_number == 1) {
            throw ReleaseException()
        }
        res_closed = true    
    }

    TestA0801() {
        if (res_number < 2) {
            res_number++
            res_num = res_number
            request_sequence = request_sequence + res_num.toString() + " " 
        } else {
            throw MyException()
        }
    }
}

main() {
    var res1 = TestA0801()
    var res2 = TestA0801()
    try {
        try (r1 = res1,
            r2 = res2,
            r3 = TestA0801()) {
            Assert.fail()
        }
    } catch (e: ReleaseException) {
        Assert.fail(reason : "All exceptions occurs during the release process should be suppressed.")
    } catch (e: MyException) {
    } catch (_) {
        Assert.fail(reason : "MyExecption was not caught.")
    }

    Assert.isTrue(res1.isClosed())
    Assert.isTrue(res2.isClosed())
    Assert.equals("1 2 ", request_sequence)
    Assert.equals(2, res_number)
}
