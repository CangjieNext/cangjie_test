/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %cffi-link %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args | compare %f
// ASSERT: regex (.*PASS.*) CASE: caseA

import std.unittest.*
import std.unittest.testmacro.*

foreign func testfunc(): CPointer<Int8>

foreign func free(ptr: CPointer<Int8>): Unit

@Test
class TestA {
    @TestCase
    func caseA(): Unit {
        unsafe {
            var ptr: CPointer<Int8> = testfunc()
            var ptrtmp: CPointer<Int8> = ptr
            expectEqual("expect", "getNum()", ptr.read(0), Int8(UInt32(r'a')))
            free(ptr)
        }
    }
}
