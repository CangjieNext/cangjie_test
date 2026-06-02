/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.core.*

@Test
class FutureTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message == expectMessage) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: Test Array ::core
     * Test API:
     * ppublic func get(): T
     * public func tryGet(): Option<T>
     * func get(ns: Int64): Option<T>
     * public func cancel(): Unit
     * func execute(): Unit
     */
    @TestCase
    func testFuture(): Unit {
        let fut1: Future<Int64> = spawn {
            sleep(Duration.second * 1)
            return 1
        }

        var timeoutcount = 0
        try {
            let res1 = fut1.get(Duration.nanosecond * 1000 * 1000)
        } catch (e: TimeoutException) {
            timeoutcount++
        }
        @Expect(timeoutcount, 1)

        let fut2: Future<Int64> = spawn {
            sleep(Duration.second * 1)
            return 1
        }
        let res2 = fut2.get(Duration.Zero)
        @Expect(res2, 1)

        let fut3: Future<Int64> = spawn {
            sleep(Duration.second * 1)
            return 1
        }
        let res3 = fut3.get(Duration.second * 2)
        @Expect(res3, 1)

        let fut4: Future<Int64> = spawn {
            sleep(Duration.second * 1)
            return 1
        }
        let res4: Option<Int64> = fut3.tryGet()
        @Expect(res4,Option<Int64>.Some(1))
        let res5: Option<Int64> = fut4.tryGet()
        @Expect(res5,Option<Int64>.None)
    }

    /*
     * Test description: Test Array ::core
     * Test API:
     * ppublic func get(): T
     * public func tryGet(): Option<T>
     * func get(ns: Int64): Option<T>
     * public func cancel(): Unit
     * func execute(): Unit
     */
    @TestCase
    func testInvalidFuture(): Unit {
        var caseException01: ?Exception = None
        let fut5 = spawn {
            throw Exception("test exception")
        }
        try {
            fut5.get()
        } catch (e: Exception) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidFuture_01",
            caseException01,
            "test exception"
        )
    }
}
