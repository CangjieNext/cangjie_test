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
@C
func cptr(a: CPointer<Int8>): CPointer<Int8> {
    var b: CPointer<Int8> = a
    unsafe { b.write(0, 49) }
    return b
}

@CallingConv[CDECL]
foreign {
    func get_cptr(cb: CFunc<(CPointer<Int8>) -> CPointer<Int8>>): CPointer<Int8>

    func free(cp: CPointer<Int8>): Unit

    func printf(fmt: CString): Int32
}

unsafe main(): Int64 {
    var res: CPointer<Int8> = get_cptr(cptr)
    if (res.read() == 49) {
        free(res)
        return 0
    } else {
        return 1
    }
}
