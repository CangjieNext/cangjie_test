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

@C
struct teststructtmp {
    public var i8: Int8 = 0
    public var ui8: UInt8 = 0
}

@C
func cstruct(a: teststructtmp): teststructtmp {
    var b: teststructtmp = a
    b.i8 = 10
    return b
}

foreign func get_cstruct(cb: CFunc<(teststructtmp) -> teststructtmp>): teststructtmp

unsafe main(): Int64 {
    var res: teststructtmp = get_cstruct(cstruct)

    if ((res.i8 == 10) && (res.ui8 == 0)) {
        return 0
    } else {
        return 1
    }
}
