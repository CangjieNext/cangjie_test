/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test.c
// DEPENDENCE: withForeign.cj

// EXEC: %clang %clang_shared_opt test.c -o libtest.%dylib_suffix
// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt withForeign.cj -o libwithForeign.%middle --mock=on 2>&1
// EXEC: %compiler %cmp_opt -Woff=all --test-only %f libwithForeign.%middle -L./ -ltest -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

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
