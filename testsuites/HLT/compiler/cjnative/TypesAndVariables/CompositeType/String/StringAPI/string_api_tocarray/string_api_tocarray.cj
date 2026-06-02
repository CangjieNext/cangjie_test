/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct MyRecord {
    public MyRecord(var a: Int64) {}
}

foreign func cTest(x: CPointer<UInt8>): CPointer<UInt8>

foreign func free(cp: CPointer<UInt8>): Unit

unsafe main(): Int64 {
    var a = "abc"
    var b = LibC.mallocCString(a).getChars()
    var ptr: CPointer<UInt8> = unsafe { cTest(b) }
    if ((ptr.read(0) == 97) && (ptr.read(1) == 98) && (ptr.read(2) == 99)) {
        free(ptr)
        return 0
    }
    return 1
}
