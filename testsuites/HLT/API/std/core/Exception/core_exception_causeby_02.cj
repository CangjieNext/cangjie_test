/*
  * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
  * This source file is part of the Cangjie project, licensed under Apache-2.0
  * with Runtime Library Exception.
  * 
  * See https://cangjie-lang.cn/pages/LICENSE for license information.
  */
 
// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:InvalidConfigurationException
// ASSERT: scan Failed in InvalidConfigurationException
// ASSERT: scan Caused by: IndexOutOfBoundsException: Failed in IndexOutOfBoundsException
// ASSERT: scan Caused by: IOException: IOException~

import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCauseby {
    public func test_exception_01(){
        try {
           test_exception_02()
        } catch(e: Exception) {
            let exception = InvalidConfigurationException("Failed in InvalidConfigurationException")
            exception.causedBy = e
            exception.printStackTrace()
            throw exception
        }
    }

    public func test_exception_02(){
        try {
           test_exception_03()
        } catch(e: Exception) {
            e.printStackTrace()
            throw IndexOutOfBoundsException("Failed in IndexOutOfBoundsException",e)
        }
    }

    public func test_exception_03(){
        test_exception_04()
    }

    public func test_exception_04(){
        throw IOException("IOException~")  
    }

    @TestCase
    public func test_01(): Unit {
        test_exception_01()
    } 
  
}

class InvalidConfigurationException <: Exception {
    public init() {
      super()
    }
    public init(message: String) {
      super(message)
    }
    protected override func getClassName(): String {
        return "InvalidConfigurationException"
    }
}

class IndexOutOfBoundsException <: Exception {
    public init() {
      super()
    }
    public init(message: String) {
      super(message)
    }
    public init(message: String, causedBy: Exception) {
        super(message, causedBy)
    }
    protected override func getClassName(): String {
        return "IndexOutOfBoundsException"
    }
} 

   