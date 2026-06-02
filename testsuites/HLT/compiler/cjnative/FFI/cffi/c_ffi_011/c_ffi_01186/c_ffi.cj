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

foreign func testfunc(): CFunc<(Bool, Bool) -> Bool>

var and_b1: (Bool, Bool) -> Bool = {a: Bool, b: Bool => return a && b}
var and_b2: CFunc<(Bool, Bool) -> Bool> = {a: Bool, b: Bool => return a && b}

unsafe main(): Int64 {
    var and_c1: CFunc<(Bool, Bool) -> Bool> = and_b1
    var and_c2: CFunc<(Bool) -> Bool> = and_b2
    return 0
}
// ASSERT: scan sema_mismatched_types
