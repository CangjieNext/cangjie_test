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

foreign func AllocCPointer(): CPointer<Int32>

foreign func GetMaxFuncPtr(): CFunc<(CPointer<Int32>) -> (CPointer<Int32>)>

foreign func free(cp: CPointer<Int32>): Unit

var count = 0

func FuncFromC(): Int64 {
    var a = unsafe { GetMaxFuncPtr() }
    var tmp = unsafe { AllocCPointer() }
    unsafe { tmp.write(0, 1) }
    var b = unsafe { a(tmp) }
    var res = unsafe { b.read(0) }

    if (res == 2) {
        count += 1
    }
    unsafe { free(b) }
    return 0
}

main(): Int64 {
    FuncFromC()

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
