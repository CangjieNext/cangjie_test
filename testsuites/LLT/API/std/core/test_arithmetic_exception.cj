/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class ArithmeticExceptionTest {
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
     * Test description: Test RuneExtension ::core
     * Test API:
     * public func isAscii(): Bool
     */
    @TestCase
    func testArithmeticException(): Unit {
        var caseException01: ?Exception = None
        try {
            throw ArithmeticException()
        } catch (e: ArithmeticException) {
            caseException01 = e
            @Expect(caseException01.toString(),Some("ArithmeticException").toString())
        }
        anomalyAssert(
            "testArithmeticException_01",
            caseException01,
            ""
        )
        var caseException02: ?Exception = None
        try {
            throw ArithmeticException("test")
        } catch (e: ArithmeticException) {
            caseException02 = e
        }
        anomalyAssert(
            "testArithmeticException_01",
            caseException02,
            "test"
        )
    }
}
