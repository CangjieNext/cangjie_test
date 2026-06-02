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
    public var i8: Int8
    public var ui8: UInt8
}

@C
struct teststruct1 {
    public var i16: Int16
    public var ui8: UInt8
}

var cstruct: CFunc<(teststruct) -> teststruct1> = {
    a =>
    var b: teststruct1
    b.i16 = Int16(a.i8)
    b.ui8 = a.ui8
    return b
}

foreign func get_cstruct(): CFunc<(teststruct1) -> teststruct1>

unsafe main(): Int64 {
    cstruct = get_cstruct()
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_used_before_initialization
// ASSERT: scan sema_mismatched_types
