/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.math.*

@Test
class ExceptionTest {
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
     * Test description: Test class Error <: ToString
     * Test API:
     * public operator func ==(that: Range<T>): Bool
     * public operator func !=(that: Range<T>): Bool
     */
    @TestCase
    func testError(): Unit {
        var caseException01: ?Exception = None
        try {
            throw OverflowException()
        } catch (e: Exception) {
            caseException01 = e
        }
        anomalyAssert(
            "testError_01",
            caseException01,
            ""
        )

        var caseException02: ?Exception = None
        try {
            throw OverflowException("123")
        } catch (e: Exception) {
            caseException02 = e
        }
        anomalyAssert(
            "testError_02",
            caseException02,
            "123"
        )

        var caseException03: ?Exception = None
        try {
            throw SpawnException()
        } catch (e: Exception) {
            caseException03 = e
        }
        anomalyAssert(
            "testError_03",
            caseException03,
            ""
        )

        var caseException04: ?Exception = None
        try {
            throw SpawnException("123")
        } catch (e: Exception) {
            caseException04 = e
        }
        anomalyAssert(
            "testError_04",
            caseException04,
            "123"
        )

        var caseException05: ?Exception = None
        try {
            throw NegativeArraySizeException()
        } catch (e: Exception) {
            caseException05 = e
        }
        anomalyAssert(
            "testError_05",
            caseException05,
            ""
        )

        var caseException06: ?Exception = None
        try {
            throw NegativeArraySizeException("123")
        } catch (e: Exception) {
            caseException06 = e
        }
        anomalyAssert(
            "testError_06",
            caseException06,
            "123"
        )

        var caseException07: ?Exception = None
        try {
            throw IllegalMemoryException()
        } catch (e: Exception) {
            caseException07 = e
        }
        anomalyAssert(
            "testError_07",
            caseException07,
            ""
        )

        var caseException08: ?Exception = None
        try {
            throw IllegalMemoryException("123")
        } catch (e: Exception) {
            caseException08 = e
        }
        anomalyAssert(
            "testError_08",
            caseException08,
            "123"
        )

        var caseException09: ?Exception = None
        try {
            throw IllegalStateException("123")
        } catch (e: Exception) {
            caseException09 = e
        }
        anomalyAssert(
            "testError_09",
            caseException09,
            "123"
        )
        var caseException10: ?Exception = None
        try {
            throw UnsupportedException("123")
        } catch (e: Exception) {
            caseException10 = e
        }
        anomalyAssert(
            "testError_10",
            caseException10,
            "123"
        )
        var caseException11: ?Exception = None
        try {
            throw UnsupportedException()
        } catch (e: Exception) {
            @Expect(e.toString(),"UnsupportedException")
            caseException11 = e
        }
        anomalyAssert(
            "testError_11",
            caseException11,
            ""
        )
    }

    /*
     * Test description: Test class Error <: ToString
     * Test API:
     * Throwable
     */
    @TestCase
    func testThrowable(): Unit {
        var err = AException("ce shi", 123)
        @Expect(err.toString(),"Exception: " + err.message)
    }
}

class AException <: Exception {
    private let Index: Int64

    public init(str: String, index: Int64) {
        super(str)
        Index = index
    }
}
