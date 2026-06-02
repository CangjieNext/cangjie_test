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

foreign func free(cp: CPointer<Int8>): Unit

var count = 0
var cptr: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = {
    a =>
    if (unsafe { a.read() == 48 }) {
        count += 1
    }
    var b: CPointer<Int8> = a
    unsafe { b.write(0, 49) } // ascii: '1' => 49
    return b
}

foreign func get_cptr(cb: CFunc<(CPointer<Int8>) -> CPointer<Int8>>): CPointer<Int8>

unsafe main(): Int64 {
    var res: CPointer<Int8> = get_cptr(cptr)
    if (res.read().toString() == "49") {
        count += 1
    }
    free(res)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
