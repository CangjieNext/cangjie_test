/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan FAILED: 1
// ASSERT: scan Assert Failed: `(@AssertThrows(E2<Int64>))`
// ASSERT: scan expected types: E2<Int64>
// ASSERT: scan caught exception: E2<String>

class E2<T> <: Exception {
    E2(let typeName: String) {}

    protected override func getClassName(): String {
        return "E2<${typeName}>"
    }
}

@Test
func assertThrows_handle_exception_with_generic_argument() {
    @AssertThrows[E2<Int64>]({
        throw E2<Int64>("Int64")
    })
}

@Test
func assertThrows_must_not_catch_deifferetnly_parametrized_generic_exception() {
    @AssertThrows[E2<Int64>]({
        throw E2<String>("String")
    })
}
