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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

@C
struct teststruct {
    public var i8: Int8 = 0
    public var ui8: UInt8 = 0
}

var cstruct1: (teststruct) -> teststruct = {
    a =>
    var b: teststruct = a
    b.i8 = 10
    return b
}
var cstruct2: CFunc<(teststruct) -> teststruct> = {
    a =>
    var b: teststruct = a
    b.i8 = 10
    return b
}

foreign func get_cstruct(): (teststruct) -> teststruct

unsafe main(): Int64 {
    cstruct2 = cstruct1
    var cstruct3: CFunc<(teststruct, teststruct) -> teststruct> = cstruct2
    return 0
}
// ASSERT: scan sema_invalid_cfunc_return_type
// ASSERT: scan sema_mismatched_types
