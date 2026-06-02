/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a14_01

  @Level:         1

  @Assertion:    12.1.2(14) However, if it is necessary to explicitly catch and handle any exceptions
                            that may be thrown during a try block or resource request and release,
                            it is still possible to include catch blocks and a finally block 
                            in a try-with-resources expression:

  @Description:  Checks that all exceptions thrown during requesting or releasing the resources
                 for the try_with_resource expression are correctly handled with catch & finally blocks of expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class TryException <: Exception {}
open class RequestException <: Exception {}
open class ReleaseException <: Exception {}
var res_number = 0
public class TestA1401 <: Resource {
    var res_closed : Bool = false
    public func isClosed() : Bool {
        return res_closed
    }
    public func close() : Unit {
        if (res_number == 2) {
            throw ReleaseException()
        }
        res_closed = true    
    }

    TestA1401() {
        res_number++
        if (res_number == 1) {
            throw RequestException()
        }
    }
}

main() {
   var finally_block_executed : Bool
// test case #1
    var requestException : Bool = false
    finally_block_executed = false
    try (r1 = TestA1401()) {
    } catch (e: RequestException) {
        requestException = true
    } finally {
        finally_block_executed = true    
    }
    Assert.isTrue(finally_block_executed)
    Assert.isTrue(requestException, reason : "Expected RequestException")

// test case #2
    var releaseException : Bool = false
    finally_block_executed = false
    try (r2 = TestA1401()) {
    } catch (e: ReleaseException) {
        releaseException = true
    } finally {
        finally_block_executed = true    
    }
    Assert.isTrue(finally_block_executed)
    Assert.isTrue(releaseException, reason : "Expected ReleaseException")

// test case #3
    var tryException : Bool = false
    finally_block_executed = false
    try (r3 = TestA1401()) {
        throw TryException()
    } catch (e: TryException) {
        tryException = true
    } finally {
        finally_block_executed = true    
    }
    Assert.isTrue(finally_block_executed)
    Assert.isTrue(tryException, reason : "Expected TryException")
}
