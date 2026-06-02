/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@CallingConv[CDECL]
foreign {
    func cstrfunc(p: CPointer<Int8>): CPointer<Int8>

    func getcstr(): CPointer<Int8>

    func free(cp: CPointer<Int8>): Unit

    func printf(fmt: CString, ...): Int32
}

unsafe main(): Int64 {
    var cstr: CPointer<Int8> = getcstr()
    var newcstr: CPointer<Int8> = cstrfunc(cstr)

    if ((newcstr.read(0) == 104) && (newcstr.read(1) == 101) && (newcstr.read(2) == 108) && (newcstr.read(3) == 108) && (newcstr
        .read(4) == 111) && (newcstr.read(5) == 32) && (newcstr.read(6) == 119) && (newcstr.read(7) == 111) && (newcstr
        .read(8) == 114) && (newcstr.read(9) == 108) && (newcstr.read(10) == 100)) {
        free(cstr)
        free(newcstr)
        return 0
    } else {
        return 1
    }
}
