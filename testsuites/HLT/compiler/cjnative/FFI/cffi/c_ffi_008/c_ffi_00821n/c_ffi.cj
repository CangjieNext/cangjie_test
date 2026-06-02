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
foreign struct teststruct {  
    public var i8: Int8
    public var ui8: UInt8
    public var ptr: CPointer<UInt8>
}

foreign func testfunc(): CPointer<Bool>

unsafe main():Int64 {
    return 0
}
// ASSERT: scan parse_illegal_modifier_in_scope
