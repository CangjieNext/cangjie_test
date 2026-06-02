/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) DEPENDENCE: pointer.c
// (not Windows) EXEC: %clang %clang_opt pointer.c -o %cffi_output
// (not Windows) EXEC: %compiler %cmp_opt %ffic_opt -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

foreign func pointer(): CPointer<Int64>

foreign func pointer_2(): CPointer<Int64>

foreign func free(a: CPointer<Int64>): Unit

@Test
class TestCPointer {
    @TestCase
    func test_isNull(): Unit {
        unsafe {
            var a0 = CPointer<Int64>()
            @Assert(a0.isNull(), true)
            @Assert(a0.isNotNull(), false)
            free(a0)

            var a1 = pointer()
            a1.write(1)
            @Assert(a1.isNull(), false)
            @Assert(a1.isNotNull(), true)
            free(a1)

            var a2 = pointer()
            a2.write(1)
            @Assert(a2.isNull(), false)
            @Assert(a2.isNotNull(), true)
            free(a2)

            var a3 = unsafe { LibC.mallocCString("test") }
            @Assert(a3.getChars().isNull(), false)
            @Assert(a3.getChars().isNotNull(), true)
            LibC.free(a3)
        }
    }

    @TestCase
    func test_ops(): Unit {
        unsafe {
            var a0 = CPointer<Int64>()
            @Assert(a0.toUIntNative(), 0)
            a0 = a0 + 1
            @Assert(a0.toUIntNative(), 8)
            a0 = a0 - 1
            @Assert(a0.toUIntNative(), 0)
            free(a0)

            var a1 = pointer()
            var a2 = a1 + 1
            @Assert((a2.toUIntNative() - a1.toUIntNative()), 8)
            free(a1)
        }
    }

    @TestCase
    func test_read_write(): Unit {
        unsafe {
            var a0 = pointer_2()
            a0.write(1)
            @Assert(a0.read(), 1)
            a0.write(1, 2)
            @Assert(a0.read(1), 2)
            a0.write(1, 11)
            @Assert(a0.read(1), 11)
            a0.write(0, 11)
            @Assert(a0.read(), 11)
            free(a0)
        }
    }
}
