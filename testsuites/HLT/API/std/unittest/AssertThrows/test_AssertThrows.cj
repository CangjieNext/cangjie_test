/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

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
public class Test_AssertThrows {
    @TestCase
    func test_without_name(): Unit {
        let e = @AssertThrows(throw ErrorForTest("ErrorForTest"))
        @AssertThrows(Option<Any>.None.getOrThrow())
        @AssertThrows(throw Exception())
        @AssertThrows({
            Option<Any>.None.getOrThrow()
            throw ErrorForTest()
            throw Exception()
        })
        @Expect(e.message, "ErrorForTest")
    }

    @TestCase
    func test_with_name(): Unit {
        let e0 = @AssertThrows[ErrorForTest](throw ErrorForTest())
        @Expect(e0.message, "")
        @AssertThrows[NoneValueException](Option<Any>.None.getOrThrow())
        @AssertThrows[Exception](throw Exception())

        // several exceptions
        let e1 = @AssertThrows[Exception]({
            throw NoneValueException("exception_1")
            throw NoneValueException()
            throw Exception("exception_3")
            throw ErrorForTest("ErrorForTest")
        })
        @Expect(e1.message, "exception_1")

        // several types
        let e2 = @AssertThrows[IllegalStateException | NoneValueException | ErrorForTest]({
            throw ErrorForTest("exception_1")
            throw IllegalStateException("exception_2")
        })
        @Expect(e2.message, "exception_1")
    }
}
