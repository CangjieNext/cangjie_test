/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 

import stdx.serialization.serialization.*
import stdx.encoding.json.*
import std.collection.*
import std.math.*

/*
 * Test description: Test the funcs for Serializable
 * Test class:
 * public class DataModelException <: Exception
 */
@Test
class DataModelExceptionTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message.contains(expectMessage)) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: Test DataModelException ::serialization
     * Test API:
     * public class DataModelException <: Exception
     */
    @TestCase
    func testDataModelException(): Unit {
        var exception01: ?Exception = None
        try {
            throw DataModelException()
        } catch (e: DataModelException) {
            @Expect(e.toString(),"DataModelException")
            exception01 = e
        }
        anomalyAssert("testDataModelException_01", exception01, "")
        var exception02: ?Exception = None
        try {
            throw DataModelException("this is test")
        } catch (e: DataModelException) {
            exception02 = e
        }
        anomalyAssert("testDataModelException_01", exception02, "this is test")
    }
}
