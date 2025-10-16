/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test.c
// DEPENDENCE: withForeign.cj
// DEPENDENCE: withForeignOther.cj

// EXEC: %clang %clang_opt test.c -o libtest.%middle
// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt withForeign.cj -o libwithForeign.%middle --mock=on 2>&1
// EXEC: %compiler %cmp_opt -Woff=all %compile_lib_opt withForeignOther.cj -o libwithForeignOther.%middle --mock=on 2>&1
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all --test-only %f libtest.%middle libwithForeign.%middle libwithForeignOther.%middle -o %output 2>&1 | compare %f

package withForeign

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import withForeign.other.*

@Test
func test(): Unit {
    unsafe {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return get_c_b()}
            ConfigureMock.stubFunction(stubCall, [], "get_c_b", "get_c_b", #"get_c_b()"#, 27)
        }().returns(1)
        @Expect(getCBOther(), 1)
    }
}

/* SCAN-IN
error: undeclared identifier 'get_c_b'
  ==> other_package.cj:30:61:
   | 
30 |             let stubCall = @EnsurePreparedToMock {=> return get_c_b()}
   |                                                             ^ 
   | 
*/
