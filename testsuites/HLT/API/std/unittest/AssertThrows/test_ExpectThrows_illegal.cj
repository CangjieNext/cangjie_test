/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan case not interrupt here

class ErrorForTest <: Exception {
    init() {
        super()
    }
    init(message: String) {
        super(message)
    }
    protected override func getClassName(): String {
        return "ErrorForTest"
    }
}

@Test
public class Test_ExpectThrows {
    @TestCase
    func test_ExpectThrows_Illegal(): Unit {
        let e = @ExpectThrows[IllegalStateException | NoneValueException]({
            throw ErrorForTest("exception_1")
            throw IllegalStateException("exception_2")
        })
        println("case not interrupt here")
    }
}
