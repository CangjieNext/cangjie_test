/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test.c
// DEPENDENCE: withForeign.cj

// EXEC: %clang %clang_opt test.c -o libtest.%middle
// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt withForeign.cj -o libwithForeign.%middle 2>&1
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all --test-only %f libtest.%middle libwithForeign.%middle -o %output 2>&1 | compare %f

package withForeign

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
func test(): Unit {
    unsafe {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return get_c_a()}
            ConfigureMock.stubFunction(stubCall, [], "get_c_a", "get_c_a", #"get_c_a()"#, 27)
        }().returns(1)
        @Expect(getCA(), 1)
    }
}

/* SCAN-IN
error: 'get_c_a' doesn't support mocking, please be sure that its package 'withForeign' is mock-compatible (was compiled with --mock=on compilation option)
  ==> separate_without_mock_support.cj:27:61:
   | 
27 |             let stubCall = @EnsurePreparedToMock {=> return get_c_a()}
   |                                                             ^ 
   | 
 */
