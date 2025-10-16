/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1 | compare %f

import std.mock_test_util.*

public class TestA {
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<String>(dummyMockingCallHandler) }
    }
}

/* SCAN-IN
error: only mocking of classes or interfaces is supported
  ==> unsupportedType.cj:16:34:
   | 
16 |         let mockedFoo = unsafe { createMock<String>(dummyMockingCallHandler) }
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/
